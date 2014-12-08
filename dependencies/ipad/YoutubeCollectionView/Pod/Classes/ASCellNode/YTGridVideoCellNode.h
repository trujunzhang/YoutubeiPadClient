//
//  YTGridVideoCellNode.h
//  IOSTemplate
//
//  Created by djzhang on 11/17/14.
//  Copyright (c) 2014 djzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "YoutubeConstants.h"
@protocol GridViewCellDelegate;


@interface YTGridVideoCellNode : ASCellNode

- (instancetype)initWithCellNodeOfSize:(CGSize)size withVideo:(YTYouTubeVideoCache *)video delegate:(id<GridViewCellDelegate>)delegate;
@property(nonatomic, strong) YTYouTubeVideoCache * video;
@property(nonatomic, strong) id<GridViewCellDelegate> delegate;
@property(nonatomic) CGFloat durationLabelWidth;
- (void)bind:(YTYouTubeVideoCache *)video placeholderImage:(UIImage *)placeholder delegate:(id<GridViewCellDelegate>)delegate;
@end