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
#import "FrameCalculator.h"
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>
#import <AsyncDisplayKit/ASHighlightOverlayLayer.h>
#import <google-api-services-youtube/GYoutubeHelper.h>


static CGFloat kTextPadding = 10.0f;


@interface AsDetailRowChannelInfo () {
   ASTextNode * _textNode;
   ASDisplayNode * _divider;
   ASImageNode * _channelImageNode;
}

@property(nonatomic, strong) YoutubeVideoCache * cardInfo;


@end


@implementation AsDetailRowChannelInfo


- (instancetype)initWithVideo:(YoutubeVideoCache *)videoCache {
   if (!(self = [super init]))
      return nil;

   self.cardInfo = videoCache;

   self.backgroundColor = [UIColor whiteColor];

   _channelImageNode = [YTAsChannelThumbnailsImageNode nodeWithChannelId:[YoutubeParser getChannelIdByVideo:self.cardInfo]];
   [self addSubnode:_channelImageNode];

   // create a text node
   _textNode = [[ASTextNode alloc] init];

   // generate an attributed string using the custom link attribute specified above
   NSString * blurb = videoCache.snippet.channelTitle;
   NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:blurb];
   [string addAttribute:NSFontAttributeName
                  value:[UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f]
                  range:NSMakeRange(0, blurb.length)];
   [string addAttributes:@{
     NSForegroundColorAttributeName : [UIColor grayColor],
     NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternDot),
    }
                   range:[blurb rangeOfString:@"placekitten.com"]];
   _textNode.attributedString = string;

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
   CGSize measuredSize = [_textNode measure:CGSizeMake(constrainedSize.width - 2 * kTextPadding,
    constrainedSize.height - 2 * kTextPadding)];
   return CGSizeMake(constrainedSize.width, measuredSize.height + 2 * kTextPadding);
}


- (void)layout {

   _channelImageNode.frame = CGRectMake(5, 5, 28, 28);

   // called on the main thread.  we'll use the stashed size from above, instead of blocking on text sizing
   CGSize textNodeSize = _textNode.calculatedSize;
   _textNode.frame = CGRectMake(50, kTextPadding, textNodeSize.width, textNodeSize.height);

   CGFloat pixelHeight = 1.0f / [[UIScreen mainScreen] scale];
   _divider.frame = CGRectMake(0.0f, 0.0f, self.calculatedSize.width, pixelHeight);
}


@end
