//
// Created by djzhang on 12/10/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "YTAsSecondVideoRowNode.h"


@interface YTAsSecondVideoRowNode () {
   ASTextNode * _videoTitleNode;
}
@end


@implementation YTAsSecondVideoRowNode {

}

- (void)makeRowNode {
   // 2.2
   _videoTitleNode = [ASTextNode initWithAttributedString:
    [[NSAttributedString alloc] initWithString:[YoutubeParser getVideoSnippetTitle:self.nodeVideo]
                                    attributes:[self textStyleForVideoTitle]]];
   [self addSubnode:_videoTitleNode];
}


- (NSDictionary *)textStyleForVideoTitle {
   NSString * fontName = @"HelveticaNeue";
//   fontName = @"ChalkboardSE-Regular";
   UIFont * font = [UIFont fontWithName:fontName size:14.0f];

   NSMutableParagraphStyle * style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
   style.paragraphSpacing = 0.5 * font.lineHeight;
   style.hyphenationFactor = 1.0;
//   style.lineBreakMode = NSLineBreakByTruncatingTail;


   return @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
}


- (void)layout {
   _videoTitleNode.frame = CGRectMake(0, 0, self.cellSize.width, 36);
}


@end