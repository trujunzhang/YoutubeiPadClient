//
// Created by djzhang on 12/14/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "MABYT3_Track.h"


@implementation MABYT3_Track {

}


- (id)init {

   self = [super init];
   if (self) {
      _kind = @"youtube#track";
      _identifier = @"";
      _name = @"";
      _lang_default = NO;
      _cantran = NO;
   }
   return self;
}


- (id)initFromDictionary:(NSDictionary *)dict withKind:(NSString *)kind {

   self = [super init];
   if (self) {
      _kind = [NSString stringWithFormat:@"youtube#%@", kind];
      _identifier = @"";
      _name = @"";
      _lang_default = NO;
      _cantran = NO;

      if ([dict objectForKey:@"id"]) {
         _identifier = [dict objectForKey:@"id"];
      }

      if ([dict objectForKey:@"name"]) {
         _name = [dict objectForKey:@"name"];
      }
      if ([dict objectForKey:@"lang_code"]) {
         _lang_code = [dict objectForKey:@"lang_code"];
      }
      if ([dict objectForKey:@"lang_original"]) {
         _lang_original = [dict objectForKey:@"lang_original"];
      }
      if ([dict objectForKey:@"lang_translated"]) {
         _lang_translated = [dict objectForKey:@"lang_translated"];
      }
      if ([dict objectForKey:@"lang_default"]) {
         _lang_default = [dict objectForKey:@"lang_default"];
      }
      if ([dict objectForKey:@"cantran"]) {
         _cantran = [dict objectForKey:@"cantran"];
      }

   }
   return self;
}


@end