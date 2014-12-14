//
// Created by djzhang on 12/14/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "MABYT3_TranscriptText.h"


@implementation MABYT3_TranscriptText {

}


- (id)init {

   self = [super init];
   if (self) {
      _kind = @"youtube#transcriptText";
      _identifier = @"";

   }
   return self;
}


- (id)initFromDictionary:(NSDictionary *)dict {

   self = [super init];
   if (self) {
      _kind = @"youtube#transcriptText";
      _identifier = @"";

//<text ="0.11" dur="1.34">Today I want to answer one of your questions</text>
      if ([dict objectForKey:@"id"]) {
         _identifier = [dict objectForKey:@"id"];
      }

      if ([dict objectForKey:@"start"]) {
         _start = [dict objectForKey:@"start"];
      }
      if ([dict objectForKey:@"dur"]) {
         _dur = [dict objectForKey:@"dur"];
      }


   }
   return self;
}
@end