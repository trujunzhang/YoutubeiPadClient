//
// Created by djzhang on 12/12/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import "MxCoreDataManager.h"
#import "YoutubeConstants.h"
#import "MABYT3_Video.h"
#import "MagicalRecord.h"
#import "MagicalRecord+Actions.h"


@implementation MxCoreDataManager {

}

+ (void)saveWatchedVideoInfo:(YTYouTubeVideoCache *)videoInfo {

   UIApplication *application = [UIApplication sharedApplication];

   __block UIBackgroundTaskIdentifier bgTask = [application beginBackgroundTaskWithExpirationHandler:^{
       [application endBackgroundTask:bgTask];
       bgTask = UIBackgroundTaskInvalid;
   }];

   [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {

       // Do your work to be saved here


   } completion:^(BOOL success, NSError *error) {
       [application endBackgroundTask:bgTask];
       bgTask = UIBackgroundTaskInvalid;
   }];

}

@end