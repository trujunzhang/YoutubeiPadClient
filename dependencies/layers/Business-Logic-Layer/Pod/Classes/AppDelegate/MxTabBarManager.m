#import "MxTabBarManager.h"


@interface MxTabBarManager () {
   UITabBarController * _tabBarController;
}


@end


@implementation MxTabBarManager

+ (MxTabBarManager *)sharedTabBarManager {
   static MxTabBarManager * cache;
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
       cache = [[MxTabBarManager alloc] init];
   });

   return cache;
}


- (void)registerTabBarController:(UITabBarController *)tabBarController {
   _tabBarController = tabBarController;
}


- (UINavigationController *)currentNavigationController {
   return _tabBarController.selectedViewController;
}
@end
