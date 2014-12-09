#import <UIKit/UIKit.h>
@class YTVideoDetailViewController;


@interface MxTabBarManager : NSObject

+ (MxTabBarManager *)sharedTabBarManager;

- (void)registerTabBarController:(UITabBarController *)tabBarController;

- (UINavigationController *)currentNavigationController;
- (YTVideoDetailViewController *)makeVideoDetailViewController:(id)video;

- (void)pushWithVideo:(id)video;
@end
