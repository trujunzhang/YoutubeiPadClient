//
//  LeftMenuViewBase.h
//  STCollapseTableViewDemo
//
//  Created by Thomas Dupont on 09/08/13.
//  Copyright (c) 2013 iSofTom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYoutubeRequestInfo.h"

@class GYoutubeAuthUser;
@class YoutubeAuthInfo;
@class LeftMenuItemTree;


@protocol LeftMenuViewBaseDelegate<NSObject>
@optional
- (void)startToggleLeftMenuWithTitle:(NSString *)title withType:(YTPlaylistItemsType)playlistItemsType;
- (void)endToggleLeftMenuEventForChannelPageWithChannelId:(NSString *)channelId withTitle:(NSString *)title;
@end


@interface LeftMenuViewBase : UIViewController

@property(nonatomic, strong) NSArray * tableSectionArray;

@property(nonatomic, strong) NSMutableArray * headers;

- (void)setCurrentTableView:(UITableView *)tableView;

@property(nonatomic, strong) id<LeftMenuViewBaseDelegate> delegate;

- (void)defaultRefreshForSubscriptionList;
- (void)insertSubscriptionRowsAfterFetching:(NSArray *)subscriptionList;
- (void)refreshChannelInfo:(YoutubeAuthInfo *)info;

@end
