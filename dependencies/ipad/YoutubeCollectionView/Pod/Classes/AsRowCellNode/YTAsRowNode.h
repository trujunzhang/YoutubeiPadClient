//
// Created by djzhang on 12/10/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "ASControlNode+Subclasses.h"
#import "ASDisplayNode+Subclasses.h"


#import "YoutubeParser.h"
#include "YoutubeConstants.h"

#import "ASCacheNetworkImageNode.h"

#import "FrameCalculator.h"
#import "HexColor.h"

#import "AsyncDisplayKitStatic.h"


@interface YTAsRowNode :ASDisplayNode

@property(nonatomic) CGSize cellSize;
@property(nonatomic, strong) YTYouTubeVideoCache * nodeVideo;

-(void)makeRowNode;

- (instancetype)initWithCellNodeOfSize:(CGSize)cellSize withVideo:(YTYouTubeVideoCache *)nodeVideo;
@end