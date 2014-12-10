//
// Created by djzhang on 12/10/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "YTAsThirdVideoRowNode.h"


@interface YTAsThirdVideoRowNode () {

}
@end


@implementation YTAsThirdVideoRowNode {

}


- (void)makeRowNode {
   self.backgroundColor = [UIColor lightGrayColor];
}


- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
   return self.cellRect.size;
}


- (void)layout {

}


@end