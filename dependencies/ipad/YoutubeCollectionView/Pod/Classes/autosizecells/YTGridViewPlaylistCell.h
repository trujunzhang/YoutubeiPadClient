//
//  YTGridViewPlaylistCell.h
//  IOSTemplate
//
//  Created by djzhang on 11/10/14.
//  Copyright (c) 2014 djzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoutubeConstants.h"

@protocol GridViewCellDelegate;


@interface YTGridViewPlaylistCell : UICollectionViewCell

- (void)bind:(YTYouTubePlayList *)list placeholderImage:(UIImage *)image delegate:(id<GridViewCellDelegate>)delegate;
@end