//
// Created by djzhang on 12/10/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "YTAsFirstImageRowNode.h"

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "ASControlNode+Subclasses.h"
#import "ASDisplayNode+Subclasses.h"



@interface YTAsFirstImageRowNode () {
   ASImageNode * _videoCoverThumbnailsNode;
}
@end


@implementation YTAsFirstImageRowNode {

}

- (void)makeRowNode {
   // 1
   _videoCoverThumbnailsNode = [ASCacheNetworkImageNode nodeWithImageUrl:[YoutubeParser getVideoSnippetThumbnails:self.video]];
   _videoCoverThumbnailsNode.backgroundColor = [UIColor clearColor];
   [self addSubnode:_videoCoverThumbnailsNode];


}


@end