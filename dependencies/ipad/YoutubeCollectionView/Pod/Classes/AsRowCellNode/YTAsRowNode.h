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

static CGFloat COLLECTION_CELL_FIRST_HEIGHT = 142.0f;
static CGFloat COLLECTION_CELL_SECOND_HEIGHT = 50.0f;
static CGFloat COLLECTION_CELL_THIRD_HEIGHT = 22.0f;


@interface YTAsRowNode : ASDisplayNode

@property(nonatomic) CGRect cellRect;
@property(nonatomic, strong) YTYouTubeVideoCache * nodeVideo;

- (void)makeRowNode;

- (instancetype)initWithCellNodeRect:(CGRect)cellRect withVideo:(YTYouTubeVideoCache *)nodeVideo;

+(CGFloat)collectionCellHeight;
@end