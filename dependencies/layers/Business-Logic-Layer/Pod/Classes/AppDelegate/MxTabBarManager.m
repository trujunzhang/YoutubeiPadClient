#import "MxTabBarManager.h"


@interface MxTabBarManager ()


@end


@implementation MxTabBarManager

+ (MxTabBarManager *)sharedCache {
   static MxTabBarManager * cache;
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
       cache = [[MxTabBarManager alloc] init];
   });

   return cache;
}


@end
