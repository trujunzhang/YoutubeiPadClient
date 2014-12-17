//
//  LeftMenuViewBase.m
//  STCollapseTableViewDemo
//
//  Created by Thomas Dupont on 09/08/13.
//  Copyright (c) 2013 iSofTom. All rights reserved.
//

#import <Business-Logic-Layer/YoutubeAuthInfo.h>
#import <google-api-services-youtube/GYoutubeHelper.h>
#import "LeftMenuViewBase.h"
#import "UserInfoView.h"
#import "LeftMenuItemTree.h"
#import "LeftMenuTableHeaderView.h"
#import "YoutubeAuthDataStore.h"
#import "GYoutubeAuthUser.h"
#import "YoutubeParser.h"

static const int TABLE_WIDTH = 258;


@interface LeftMenuViewBase ()<UserInfoViewSigningOutDelegate, UIAlertViewDelegate>
@property(nonatomic, strong) UITableView * baseTableView;
@property(nonatomic, strong) ASImageNode * imageNode;

@end


@implementation LeftMenuViewBase


- (void)viewDidLoad {
   [super viewDidLoad];

   [self setupBackground];

   NSAssert(self.baseTableView, @"not found uitableview instance!");

   [self.view addSubview:_imageNode.view];
   [self.view addSubview:self.baseTableView];
}


- (void)setupBackground {
   _imageNode = [[ASImageNode alloc] init];
   _imageNode.backgroundColor = [UIColor lightGrayColor];
   _imageNode.image = [UIImage imageNamed:@"mt_side_menu_bg"];
}


- (void)setCurrentTableView:(UITableView *)tableView {
   self.baseTableView = tableView;

   self.baseTableView.backgroundColor = [UIColor clearColor];
   self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   self.baseTableView.showsVerticalScrollIndicator = NO;
   self.baseTableView.autoresizesSubviews = YES;
   self.baseTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}


- (void)viewWillLayoutSubviews {
   CGRect rect = self.view.bounds;
   rect.size.width = TABLE_WIDTH;
   self.baseTableView.frame = rect;
   _imageNode.frame = rect;
}


#pragma mark -
#pragma mark setup


- (void)setupSlideTableViewWithAuthInfo:(YoutubeAuthInfo *)user {
   if (user == nil)
      user = [[[YoutubeAuthDataStore alloc] init] readAuthUserInfo];

   self.baseTableView.tableHeaderView = [self getUserHeaderView:user];
}


- (void)makeDefaultTableSections {
   // 1  make section array
   LeftMenuItemTree * categoriesMenuItemTree = [LeftMenuItemTree getCategoriesMenuItemTree];

   self.tableSectionArray = @[ categoriesMenuItemTree ];

   if ([[GYoutubeHelper getInstance] isSignedIn]) {
      LeftMenuItemTree * signUserMenuItemTree = [LeftMenuItemTree getSignInMenuItemTree];
      LeftMenuItemTree * subscriptionsMenuItemTree = [LeftMenuItemTree getEmptySubscriptionsMenuItemTree];
      self.tableSectionArray = @[ signUserMenuItemTree, subscriptionsMenuItemTree, categoriesMenuItemTree ];// used
   }

   // 2 section header titles
   self.headers = [[NSMutableArray alloc] init];
   for (int i = 0; i < [self.tableSectionArray count]; i++) {
      LeftMenuItemTree * menuItemTree = self.tableSectionArray[i];

      LeftMenuTableHeaderView * header = [[[NSBundle mainBundle] loadNibNamed:@"LeftMenuTableHeaderView"
                                                                        owner:nil
                                                                      options:nil] lastObject];
      [header setupUI:menuItemTree.title];
      [self.headers addObject:header];
   }

}


#pragma mark -
#pragma mark Youtube auth login events


- (UIView *)getUserHeaderView:(YoutubeAuthInfo *)user {

   UIView * headerView = nil;
   if ([[GYoutubeHelper getInstance] isSignedIn]) {
      UserInfoView * userInfoView = [[[NSBundle mainBundle] loadNibNamed:@"UserInfoView"
                                                                   owner:nil
                                                                 options:nil] lastObject];
      userInfoView.delegate = self;
      headerView = [userInfoView bind:user];
   } else {
      headerView = [[[NSBundle mainBundle] loadNibNamed:@"UserLoginView" owner:nil options:nil] lastObject];

      //The setup code (in viewDidLoad in your view controller)
      UITapGestureRecognizer * singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(handleSingleTap:)];
      [headerView addGestureRecognizer:singleFingerTap];
   }

   headerView.frame = CGRectMake(0, 0, 256, 70);

   return headerView;
}


//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
   [self loginInTouch];
}


- (void)loginInTouch {
   GTMOAuth2ViewControllerTouch * viewController =
    [[GYoutubeHelper getInstance] getYoutubeOAuth2ViewControllerTouchWithTouchDelegate:self
                                                                       leftBarDelegate:self
                                                                          cancelAction:@selector(cancelGdriveSignIn:)];

   UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
   navigationController.view.backgroundColor = [UIColor whiteColor];
   navigationController.modalPresentationStyle = UIModalPresentationPageSheet;

   [self presentViewController:navigationController animated:YES completion:nil];
}


- (void)viewController:(UIViewController *)viewController
      finishedWithAuth:(YTOAuth2Authentication *)auth
                 error:(NSError *)error {
   [self cancelGdriveSignIn:nil];

   if (error != nil) {
      // Authentication failed
      NSLog(@"failed");
   } else {
      // Authentication succeeded
      NSLog(@"Success");

      [[GYoutubeHelper getInstance] saveAuthorizeAndFetchUserInfo:auth];
   }
}


- (void)cancelGdriveSignIn:(id)cancelGdriveSignIn {
   [self dismissViewControllerAnimated:YES completion:^(void) {
   }];
}


#pragma mark -
#pragma mark Async refresh Table View


- (void)defaultRefreshForSubscriptionList {
   [self makeDefaultTableSections];
   [self setupSlideTableViewWithAuthInfo:nil];

   [self.baseTableView reloadData];
}


- (void)insertSubscriptionRowsAfterFetching:(GYoutubeAuthUser *)user {
   [self makeDefaultTableSections];
   [self setupSlideTableViewWithAuthInfo:nil];

   // 2
   [self.baseTableView reloadData];

   // test
//   if (debugLeftMenuTapSubscription) {
//      if (self.authUser.subscriptions.count > subscriptionIndex) {
//         YTYouTubeSubscription * subscription = self.authUser.subscriptions[subscriptionIndex];
//         NSString * title = [YoutubeParser getSubscriptionSnippetTitle:subscription];
//         [self.delegate endToggleLeftMenuEventForChannelPageWithChannelId:[YoutubeParser getChannelIdBySubscription:subscription]
//                                                                withTitle:title];
//      }
//   }
}


- (void)refreshChannelInfo:(YoutubeAuthInfo *)info {
   [self setupSlideTableViewWithAuthInfo:info];
}


#pragma mark -
#pragma mark UserInfoViewSigningOutDelegate


- (void)signingOutTapped {
   UIAlertView * myAlert = [[UIAlertView alloc]
    initWithTitle:@"Title"
          message:@"Message"
         delegate:self
cancelButtonTitle:@"Cancel"
otherButtonTitles:@"Ok", nil];

   [myAlert show];
}


#pragma mark -
#pragma mark UIAlertViewDelegate


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
   if (buttonIndex == 0) {
   }
   else if (buttonIndex == 1) {
      [[GYoutubeHelper getInstance] signingOut];
      [self defaultRefreshForSubscriptionList];
   }
}


@end
