//
// Created by djzhang on 12/10/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "YTAsCollectionVideoCellNode.h"
#import "YoutubeConstants.h"
#import "YTAsFirstVideoRowNode.h"
#import "YTAsSecondVideoRowNode.h"
#import "YTAsThirdVideoRowNode.h"


@interface YTAsCollectionVideoCellNode () {
   CGSize _kittenSize;
   YTYouTubeVideoCache * _nodeVideo;

   YTAsFirstVideoRowNode * _asFirstVideoRowNode;
   YTAsSecondVideoRowNode * _asSecondVideoRowNode;
   YTAsThirdVideoRowNode * _asThirdVideoRowNode;
}
@end


@implementation YTAsCollectionVideoCellNode {

}


- (instancetype)initWithCellNodeOfSize:(CGSize)cellSize withVideo:(id)nodeVideo {
   if (!(self = [super init]))
      return nil;

   _kittenSize = cellSize;
   _nodeVideo = nodeVideo;

   _asFirstVideoRowNode = [[YTAsFirstVideoRowNode alloc] initWithCellNodeOfSize:cellSize
                                                                      withVideo:nodeVideo];

   _asSecondVideoRowNode = [[YTAsSecondVideoRowNode alloc] initWithCellNodeOfSize:cellSize
                                                                        withVideo:nodeVideo];

   _asThirdVideoRowNode = [[YTAsThirdVideoRowNode alloc] initWithCellNodeOfSize:cellSize
                                                                      withVideo:nodeVideo];

   [self addSubnode:_asFirstVideoRowNode];
   [self addSubnode:_asSecondVideoRowNode];
   [self addSubnode:_asThirdVideoRowNode];


   return self;
}


- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
   return _kittenSize;
}


- (void)layout {

}


@end