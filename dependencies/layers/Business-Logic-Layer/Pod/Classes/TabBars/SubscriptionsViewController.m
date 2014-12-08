//
//  SubscriptionsViewController.m
//  TubeIPadApp
//
//  Created by djzhang on 10/23/14.
//  Copyright (c) 2014 djzhang. All rights reserved.
//


#import "SubscriptionsViewController.h"

#import "YTVideoDetailViewController.h"
#import "LeftRevealHelper.h"
#import "YoutubeChannelPageViewController.h"
#import "CollectionViewCellConstant.h"


@interface SubscriptionsViewController ()<GridViewCellDelegate, YoutubeCollectionNextPageDelegate> {
   YTCollectionViewController * _gridViewController;
   YTPlaylistItemsType _playlistItemsType;
}


@end


@implementation SubscriptionsViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   // 1
   // Do any additional setup after loading the view, typically from a nib.
   self.tabBarItem.title = @"Subscriptions";
   self.view.backgroundColor = [UIColor clearColor];
}


- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated {
   [super viewDidAppear:animated];

}


#pragma mark -
#pragma mark  GridViewCellDelegate


- (void)gridViewCellTap:(id)video {
   [[LeftRevealHelper sharedLeftRevealHelper] closeLeftMenuAndNoRearOpen];

   YTVideoDetailViewController * controller = [[YTVideoDetailViewController alloc] initWithDelegate:self
                                                                                              video:video];
   [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"back"
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:nil
                                                                             action:nil]];
   [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark -
#pragma mark Left menu events


- (void)startToggleLeftMenuWithTitle:(NSString *)title withType:(YTPlaylistItemsType)playlistItemsType {
   // 1
   _gridViewController = [[YTCollectionViewController alloc] init];
   _gridViewController.title = title;
   _gridViewController.delegate = self;
   _gridViewController.nextPageDelegate = self;
   _gridViewController.numbersPerLineArray = [NSArray arrayWithObjects:@"3", @"4", nil];

   // 2
   _gridViewController.navigationItem.leftBarButtonItem = self.revealButtonItem;

   // 3
   self.navigationController.viewControllers = [NSArray arrayWithObject:_gridViewController];

   // 3
   _playlistItemsType = playlistItemsType;
   [_gridViewController fetchPlayListByType:playlistItemsType];
}


- (void)endToggleLeftMenuEventForChannelPageWithChannelId:(NSString *)channelId withTitle:(NSString *)title {
   // 1
   YoutubeChannelPageViewController * controller =
    [[YoutubeChannelPageViewController alloc] initWithChannelId:channelId];

   controller.navigationItem.leftBarButtonItem = self.revealButtonItem;
   controller.title = title;
   controller.delegate = self;

   // 2
   self.navigationController.viewControllers = [NSArray arrayWithObject:controller];
}


#pragma mark -
#pragma mark YoutubeCollectionNextPageDelegate


- (void)executeRefreshTask {
   [_gridViewController fetchPlayListByType:_playlistItemsType];
}


- (void)executeNextPageTask {
   [_gridViewController fetchPlayListByPageToken];
}


@end
