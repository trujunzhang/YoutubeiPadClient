//
//  AsDetailRowChannelInfo.m
//  YoutubePlayApp
//
//  Created by djzhang on 10/14/14.
//  Copyright (c) 2014 djzhang. All rights reserved.
//

#import "AsDetailRowChannelInfo.h"
#import "YoutubeVideoCache.h"
#import "YoutubeParser.h"
#import "ASCacheNetworkImageNode.h"
#import "YTAsChannelThumbnailsImageNode.h"
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>
#import <AsyncDisplayKit/ASHighlightOverlayLayer.h>
#import "AsyncDisplayKitStatic.h"
#import "FrameCalculator.h"

static CGFloat KDetailRowHeight = 50.0f;


@interface AsDetailRowChannelInfo () {
   ASTextNode * _textNode;
   ASDisplayNode * _divider;
   ASImageNode * _channelImageNode;

   CGFloat _tableViewWidth;

   int cStep;
}

@property(nonatomic, strong) YoutubeVideoCache * cardInfo;


@end


@implementation AsDetailRowChannelInfo


- (instancetype)initWithVideo:(id)videoCache withTableWidth:(CGFloat)tableViewWidth {
   if (!(self = [super init]))
      return nil;

   self.cardInfo = videoCache;
   _tableViewWidth = tableViewWidth;

   _channelImageNode = [YTAsChannelThumbnailsImageNode nodeWithChannelId:[YoutubeParser getChannelIdByVideo:self.cardInfo]
                                                               forCorner:5.0f];

   _channelImageNode.image = [UIImage imageNamed:@"account_default_thumbnail.png"];//test
   [self setNodeTappedEvent];//test

   [self addSubnode:_channelImageNode];

   // create a text node
   // generate an attributed string using the custom link attribute specified above
   NSString * blurb = [YoutubeParser getVideoSnippetChannelTitle:self.cardInfo];

   NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:blurb];
   [string addAttribute:NSFontAttributeName
                  value:[UIFont fontWithName:@"HelveticaNeue-Light" size:13.0f]
                  range:NSMakeRange(0, blurb.length)];

   _textNode = [ASTextNode initWithAttributedString:string];

   // add it as a subnode, and we're done
   [self addSubnode:_textNode];

   // hairline cell separator
   _divider = [[ASDisplayNode alloc] init];
   _divider.backgroundColor = [UIColor lightGrayColor];
   [self addSubnode:_divider];

   return self;
}


- (void)didLoad {
   // enable highlighting now that self.layer has loaded -- see ASHighlightOverlayLayer.h
   self.layer.as_allowsHighlightDrawing = YES;

   [super didLoad];
}


- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
   // called on a background thread.  custom nodes must call -measure: on their subnodes in -calculateSizeThatFits:

   CGSize size = CGSizeMake(_tableViewWidth, KDetailRowHeight);
   return size;
}


- (void)layout {

   _channelImageNode.frame = [FrameCalculator frameForDetailRowChannelInfoThumbnail:self.calculatedSize.width
                                                                         withHeight:KDetailRowHeight];

   // called on the main thread.  we'll use the stashed size from above, instead of blocking on text sizing
   _textNode.frame = [FrameCalculator frameForDetailRowChannelInfoTitle:self.calculatedSize.width
                                                           withLeftRect:_channelImageNode.frame];

   _divider.frame = [FrameCalculator frameForBottomDivide:self.calculatedSize.width containerHeight:KDetailRowHeight];
}


- (void)setNodeTappedEvent {
   // configure the button
   _channelImageNode.userInteractionEnabled = YES; // opt into touch handling
   [_channelImageNode addTarget:self
                         action:@selector(buttonTapped:)
               forControlEvents:ASControlNodeEventTouchUpInside];
}


- (void)buttonTapped:(id)buttonTapped {
   NSArray * colorArray = @[
    [UIColor redColor],
    [UIColor greenColor],
    [UIColor blueColor],
   ];

   cStep++;
   _textNode.backgroundColor = colorArray[cStep % 3];


}


@end
