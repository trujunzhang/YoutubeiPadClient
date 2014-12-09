#import "MxTabBarManager.h"
#import "YTVideoDetailViewController.h"


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


- (YTVideoDetailViewController *)makeVideoDetailViewController:(id)video {
   return [[YTVideoDetailViewController alloc] initWithVideo:video];
}


- (void)pushWithVideo:(id)video {
   YTVideoDetailViewController * controller = [self makeVideoDetailViewController:video];

   UINavigationController * navigationController = [self currentNavigationController];

   [navigationController pushViewController:controller animated:YES];
}
@end
