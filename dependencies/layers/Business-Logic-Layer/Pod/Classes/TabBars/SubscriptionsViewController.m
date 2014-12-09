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


@interface SubscriptionsViewController ()<YoutubeCollectionNextPageDelegate> {
   YTCollectionViewController * _gridViewController;
   YTPlaylistItemsType _playlistItemsType;
}


@end


@implementation SubscriptionsViewController

- (void)viewDidLoad {
   [super viewDidLoad];

   // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark  GridViewCellDelegate


- (void)gridViewCellTap:(id)video {
   [[LeftRevealHelper sharedLeftRevealHelper] closeLeftMenuAndNoRearOpen];

   YTVideoDetailViewController * controller = [[YTVideoDetailViewController alloc] initWithVideo:video];

   UINavigationItem * item = self.navigationItem;
   [item setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"back"
                                                               style:UIBarButtonItemStyleBordered
                                                              target:nil
                                                              action:nil]];

   UINavigationController * navigationController = self.navigationController;
   [navigationController pushViewController:controller animated:YES];
}


#pragma mark -
#pragma mark Left menu events


- (void)startToggleLeftMenuWithTitle:(NSString *)title withType:(YTPlaylistItemsType)playlistItemsType {
   // 1
   YTCollectionViewController * gridViewController = [[YTCollectionViewController alloc] init];
   gridViewController.title = title;
   gridViewController.nextPageDelegate = self;
   gridViewController.numbersPerLineArray = [NSArray arrayWithObjects:@"3", @"4", nil];

   // 2
   gridViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"mt_side_tab_button"]
                                                                                          style:UIBarButtonItemStyleBordered
                                                                                         target:self
                                                                                         action:@selector(leftBarButtonItemAction:)];

   // 3
   self.navigationController.viewControllers = [NSArray arrayWithObject:gridViewController];

   // 4
   [gridViewController fetchPlayListByType:playlistItemsType];

   // 5
   _playlistItemsType = playlistItemsType;
   _gridViewController = gridViewController;
}


- (void)endToggleLeftMenuEventForChannelPageWithChannelId:(NSString *)channelId withTitle:(NSString *)title {
   // 1
   YoutubeChannelPageViewController * controller = [[YoutubeChannelPageViewController alloc] initWithChannelId:channelId];

   controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"mt_side_tab_button"]
                                                                                  style:UIBarButtonItemStyleBordered
                                                                                 target:self
                                                                                 action:@selector(leftBarButtonItemAction:)];
   controller.title = title;

   // 2
   self.navigationController.viewControllers = [NSArray arrayWithObject:controller];
}


#pragma mark -
#pragma mark - Provided acction methods


- (void)leftBarButtonItemAction:(id)sender {
   [[LeftRevealHelper sharedLeftRevealHelper] toggleReveal];
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
