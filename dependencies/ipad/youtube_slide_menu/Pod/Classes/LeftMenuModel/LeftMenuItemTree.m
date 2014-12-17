//
//  LeftMenuItemTree.m
//  STCollapseTableViewDemo
//
//  Created by Thomas Dupont on 09/08/13.
//  Copyright (c) 2013 iSofTom. All rights reserved.
//

#import "LeftMenuItemTree.h"
#import "GYoutubeRequestInfo.h"


@interface LeftMenuItemTree ()<UITableViewDataSource, UITableViewDelegate>

@end


@implementation LeftMenuItemTree


- (instancetype)initWithTitle:(NSString *)title itemType:(LeftMenuItemTreeType)type rowsArray:(NSArray *)rowsArray hideTitle:(BOOL)hideTitle remoteImage:(BOOL)remoteImage {
   self = [super init];
   if (self) {
      self.title = title;
      self.itemType = type;
      self.rowsArray = rowsArray;
      self.hideTitle = hideTitle;
      self.isRemoteImage = remoteImage;
      self.cellIdentifier = [LeftMenuItemTree cellIdentifierArray][type];
   }

   return self;
}


+ (instancetype)getCategoriesMenuItemTree {
   return [[self alloc] initWithTitle:@"  Categories"
                             itemType:LMenuTreeCategories
                            rowsArray:[LeftMenuItemTree defaultCategories]
                            hideTitle:NO
                          remoteImage:NO];
}


+ (instancetype)getSignInMenuItemTree {
   return [[self alloc] initWithTitle:@"  "
                             itemType:LMenuTreeUser
                            rowsArray:[LeftMenuItemTree signUserCategories]
                            hideTitle:YES
                          remoteImage:NO];
}


+ (instancetype)getEmptySubscriptionsMenuItemTree {
   return [[self alloc] initWithTitle:@"  Subscriptions"
                             itemType:LMenuTreeSubscriptions
                            rowsArray:[[NSArray alloc] init]
                            hideTitle:NO
                          remoteImage:YES];

}


+ (NSArray *)cellIdentifierArray {
   return @[
    @"CategoriesCellIdentifier",
    @"SignUserCellIdentifier",
    @"SubscriptionsCellIdentifier",
   ];
}


#pragma mark -
#pragma mark View methods


+ (NSArray *)defaultCategories {
   NSArray * array = @[
    @[ @"Autos & Vehicles", @"Autos", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Comedy", @"Comedy", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Education", @"Education", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Entertainment", @"Entertainment", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"File & Animation", @"Film", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Gaming", @"Games", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Howto & Style", @"Howto", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Music", @"Music", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"News & Politics", @"News", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Nonprofits & Activism", @"Nonprofit", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"People & Blogs", @"People", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Pets & Animals", @"Animals", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Science & Technology", @"Tech", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Sports", @"Sports", [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"Travel & Events", @"Travel", [[NSNumber alloc] initWithInt:kUploadsTag] ],
   ];

   return array;
}


+ (NSArray *)signUserCategories {
   NSArray * array = @[
    @[ @"Subscriptions", @"subscriptions",
     [[NSNumber alloc] initWithInt:kUploadsTag] ],
    @[ @"What to Watch", @"recommended",
     [[NSNumber alloc] initWithInt:kWatchHistoryTag] ],
    @[ @"Favorite", @"favorites",
     [[NSNumber alloc] initWithInt:kFavoritesTag] ],
    @[ @"Watch Later", @"watch_later",
     [[NSNumber alloc] initWithInt:kWatchLaterTag] ],
    @[ @"Playlists", @"playlists",
     [[NSNumber alloc] initWithInt:kUploadsTag] ],
   ];

   return array;
}


+ (NSString *)getTitleInRow:(NSArray *)array {
   return array[0];
}


+ (NSString *)getThumbnailUrlInRow:(NSArray *)array {
   return array[1];
}

+ (NSString *)getChannelIdUrlInRow:(NSArray *)array {
   return array[1];
}



+ (YTPlaylistItemsType)getTypeInRow:(NSArray *)array {
   return [array[2] intValue];
}

@end
