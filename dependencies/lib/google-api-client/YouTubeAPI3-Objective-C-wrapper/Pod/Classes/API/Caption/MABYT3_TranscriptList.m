//
// Created by djzhang on 12/14/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "MABYT3_TranscriptList.h"
#import "MABYT3_Track.h"


@implementation MABYT3_TranscriptList {

}


- (id)init {

   self = [super init];
   if (self) {
      _kind = @"youtube#transcript_list";
      _identifier = @"";
   }
   return self;
}


- (id)initFromDictionary:(NSDictionary *)dict {

   self = [super init];
   if (self) {
      _kind = @"youtube#channel";
      _identifier = @"";

      _trackList = [[NSMutableArray alloc] init];

      if ([dict objectForKey:@"docid"]) {
         _identifier = [dict objectForKey:@"docid"];
      }

      if ([dict objectForKey:@"track"]) {
         MABYT3_Track * track = [[MABYT3_Track alloc] initFromDictionary:[dict objectForKey:@"snippet"]];
         [_trackList addObject:track];
      }

   }
   return self;
}

@end