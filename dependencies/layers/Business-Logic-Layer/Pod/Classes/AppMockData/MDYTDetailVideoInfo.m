//
// Created by djzhang on 12/12/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "MDYTDetailVideoInfo.h"


@implementation MDYTDetailVideoInfo {

}


- (instancetype)init {
   self = [super init];
   if (self) {
      // line001
      self.snippet.channelTitle = @"Jean-Marc Denis";

      // line002
      self.snippet.descriptionString=@"";
   }

   return self;
}


@end