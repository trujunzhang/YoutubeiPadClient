//
// Created by djzhang on 12/10/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "YTAsRowNode.h"


@implementation YTAsRowNode {

}

- (instancetype)initWithCellNodeOfSize:(CGSize)cellSize withVideo:(YTYouTubeVideoCache *)nodeVideo { //242,242
   if (!(self = [super init]))
      return nil;

   self.cellSize = cellSize;
   self.nodeVideo = nodeVideo;

   [self makeRowNode];

   return self;
}

@end