//
// Created by djzhang on 12/13/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "AsDetailRowVideoInfo.h"

#import "YoutubeParser.h"
#import "YoutubeVideoDescriptionStringAttribute.h"
#import "Foundation.h"
#import "AsyncDisplayKitStatic.h"
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>
#import <AsyncDisplayKit/ASHighlightOverlayLayer.h>

static CGFloat DetailRowVideoInfoHeight = 50.0f;


@implementation AsDetailRowVideoInfo {
   ASTextNode * _channelTitleNode;
   ASTextNode * _publishedAtNode;

   ASDisplayNode * _divider;


   CGFloat _tableViewWidth;
}

- (instancetype)initWithVideo:(YTYouTubeVideoCache *)videoCache withTableWidth:(CGFloat)tableViewWidth {
   if (!(self = [super init]))
      return nil;

   _tableViewWidth = tableViewWidth;

   // create a text node
   _channelTitleNode = [ASTextNode initWithAttributedString:
    [NSAttributedString attributedStringForDetailRowChannelTitle:[YoutubeParser getVideoSnippetTitle:videoCache]
                                                        fontSize:15.0f]];



   return self;
}


- (void)didLoad {
   // enable highlighting now that self.layer has loaded -- see ASHighlightOverlayLayer.h
   self.layer.as_allowsHighlightDrawing = YES;

   [super didLoad];
}


- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
   // called on a background thread.  custom nodes must call -measure: on their subnodes in -calculateSizeThatFits:
//   CGSize measuredSize = [_channelTitleNode measure:CGSizeMake(constrainedSize.width - 2 * kTextPadding, constrainedSize.height - 2 * kTextPadding)];

//   return CGSizeMake(_tableViewWidth, measuredSize.height + 2 * kTextPadding);
   return CGSizeZero;
}


- (void)layout {
   // called on the main thread.  we'll use the stashed size from above, instead of blocking on text sizing
//   CGSize textNodeSize = _channelTitleNode.calculatedSize;
//   _channelTitleNode.frame = CGRectMake(kTextPadding, kTextPadding, self.calculatedSize.width - kTextPadding * 2, textNodeSize.height);
}

@end