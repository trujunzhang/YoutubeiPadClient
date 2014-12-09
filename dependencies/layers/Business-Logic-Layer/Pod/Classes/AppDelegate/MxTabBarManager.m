#import <google-api-services-youtube/GYoutubeHelper.h>
#import "MxTabBarManager.h"
#import "YTVideoDetailViewController.h"
#import "LeftMenuViewController.h"
#import "LeftRevealHelper.h"


@interface MxTabBarManager ()<GYoutubeHelperDelegate> {
   UITabBarController * _tabBarController;
   LeftMenuViewController * _leftViewController; // left
}


@end


@implementation MxTabBarManager

+ (MxTabBarManager *)sharedTabBarManager {
   static MxTabBarManager * cache;
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
       cache = [[MxTabBarManager alloc] init];
       [GYoutubeHelper getInstance].delegate = cache;
   });

   return cache;
}


- (void)registerTabBarController:(UITabBarController *)tabBarController withLeftViewController:(LeftMenuViewController *)leftViewController {
   _tabBarController = tabBarController;
   _leftViewController = leftViewController;
}


- (void)setLeftMenuControllerDelegate:(id)delegate {
   _leftViewController.delegate = delegate;
}


- (UINavigationController *)currentNavigationController {
   return _tabBarController.selectedViewController;
}


- (YTVideoDetailViewController *)makeVideoDetailViewController:(id)video {
   return [[YTVideoDetailViewController alloc] initWithVideo:video];
}


- (void)pushAndResetControllers:(NSArray *)controllers {
   [[LeftRevealHelper sharedLeftRevealHelper] closeLeftMenuAndNoRearOpen];

   UINavigationController * navigationController = [self currentNavigationController];

   navigationController.viewControllers = controllers;
}


- (void)pushWithVideo:(id)video {
   [[LeftRevealHelper sharedLeftRevealHelper] closeLeftMenuAndNoRearOpen];

   YTVideoDetailViewController * controller = [self makeVideoDetailViewController:video];

   UINavigationController * navigationController = [self currentNavigationController];

   [navigationController pushViewController:controller animated:YES];
}


#pragma mark -
#pragma mark GYoutubeHelperDelegate


- (void)FetchYoutubeSubscriptionListCompletion:(GYoutubeAuthUser *)user {
   [_leftViewController refreshChannelSubscriptionList:user];
}


- (void)FetchYoutubeChannelCompletion:(YoutubeAuthInfo *)info {
   [_leftViewController refreshChannelInfo:info];
}

@end
