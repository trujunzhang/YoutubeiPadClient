//
//  YoutubeCollectionViewBase.h
//  YoutubePlayApp
//
//  Created by djzhang on 10/15/14.
//  Copyright (c) 2014 djzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYoutubeRequestInfo.h"




@class GYoutubeRequestInfo;
@class YTGridViewVideoCell;
@protocol GridViewCellDelegate;


@protocol YoutubeCollectionNextPageDelegate<NSObject>

@optional
- (void)executeRefreshTask;
- (void)executeNextPageTask;
@end


@interface YoutubeCollectionViewBase : UIViewController

@property(nonatomic, assign) id<GridViewCellDelegate> delegate;

@property(nonatomic, strong) GYoutubeRequestInfo * youtubeRequestInfo;

@property(nonatomic, strong) NSArray * numbersPerLineArray;

@property(nonatomic, assign) id<YoutubeCollectionNextPageDelegate> nextPageDelegate;

- (GYoutubeRequestInfo *)getYoutubeRequestInfo;
- (void)setUICollectionView:(UICollectionView *)collectionView;
- (void)showTopRefreshing;
- (void)hideTopRefreshing;
- (UICollectionViewCell *)collectionCellAtIndexPath:(NSIndexPath *)indexPath;
- (void)search:(NSString *)text withItemType:(YTSegmentItemType)itemType;
- (void)searchByPageToken;
- (void)cleanupForTableView;
- (void)cleanup;
- (void)fetchActivityListByType:(YTSegmentItemType)type withChannelId:(NSString *)channelId;
- (void)fetchActivityListByPageToken;

- (void)fetchVideoListFromChannelWithChannelId:(NSString *)channelId;
- (void)fetchVideoListFromChannelByPageToken;
- (void)fetchPlayListFromChannelWithChannelId:(NSString *)channelId;
- (void)fetchPlayListFromChannelByPageToken;
- (void)fetchPlayListByType:(YTPlaylistItemsType)playlistItemsType;
- (void)fetchPlayListByPageToken;
- (void)fetchSuggestionListByVideoId:(NSString *)videoId;
- (void)fetchSuggestionListByPageToken;

- (int)getCurrentColumnCount:(UIInterfaceOrientation)orientation;
- (CGSize)cellSize;
- (UIEdgeInsets)getUIEdgeInsetsForLayout;
@property(nonatomic, strong) NSOperationQueue * nodeConstructionQueue;

- (void)reloadTableView:(NSArray *)array withLastRowCount:(NSUInteger)lastRowCount;
- (void)tableWillAppear;

@end
