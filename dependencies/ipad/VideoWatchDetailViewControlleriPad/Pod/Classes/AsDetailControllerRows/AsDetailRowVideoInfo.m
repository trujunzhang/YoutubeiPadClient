//
// Created by djzhang on 12/13/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "AsDetailRowVideoInfo.h"

#import "YoutubeParser.h"
#import "YoutubeVideoDescriptionStringAttribute.h"
#import "Foundation.h"
#import "AsyncDisplayKitStatic.h"
#import "FrameCalculator.h"
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>
#import <AsyncDisplayKit/ASHighlightOverlayLayer.h>

static CGFloat DetailRowVideoInfoHeight = 150.0f;

static CGFloat DetailRowVideoTitleHeight = 50.0f;


@implementation AsDetailRowVideoInfo {
   ASTextNode * _videoTitleNode;
   ASTextNode * _likeCountNode;

   ASDisplayNode * _divider;

}

- (instancetype)initWithVideo:(YTYouTubeVideoCache *)videoCache withTableWidth:(CGFloat)tableViewWidth {
   if (!(self = [super init]))
      return nil;

   // create a text node
   _videoTitleNode = [ASTextNode initWithAttributedString:
    [NSAttributedString attributedStringForDetailRowChannelTitle:[YoutubeParser getVideoSnippetTitle:videoCache]
                                                        fontSize:32.0f]];

   [self addSubnode:_videoTitleNode];

   _likeCountNode = [ASTextNode initWithAttributedString:
    [NSAttributedString attributedStringForDetailRowVideoLikeCount:[YoutubeParser getVideoSnippetTitle:videoCache]
                                                          fontSize:12.0f]];

   [self addSubnode:_likeCountNode];


   return self;
}


- (void)didLoad {
   // enable highlighting now that self.layer has loaded -- see ASHighlightOverlayLayer.h
   self.layer.as_allowsHighlightDrawing = YES;

   [super didLoad];
}


- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
   // called on a background thread.  custom nodes must call -measure: on their subnodes in -calculateSizeThatFits:
//   CGSize measuredSize = [_videoTitleNode measure:CGSizeMake(constrainedSize.width - 2 * kTextPadding, constrainedSize.height - 2 * kTextPadding)];

   return CGSizeMake(constrainedSize.width, DetailRowVideoInfoHeight);
}


- (void)layout {
   // called on the main thread.  we'll use the stashed size from above, instead of blocking on text sizing

   _videoTitleNode.frame = [FrameCalculator frameForDetailRowVideoInfoTitle:self.calculatedSize
                                                            withTitleHeight:DetailRowVideoTitleHeight
                                                             withFontHeight:20];

   _likeCountNode.frame = [FrameCalculator frameForDetailRowVideoInfoLike:_videoTitleNode.frame];

}

@end