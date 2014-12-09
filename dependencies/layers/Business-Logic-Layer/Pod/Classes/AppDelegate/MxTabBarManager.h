#import <UIKit/UIKit.h>
@class YTVideoDetailViewController;
@class LeftMenuViewController;


@interface MxTabBarManager : NSObject

+ (MxTabBarManager *)sharedTabBarManager;

- (void)registerTabBarController:(UITabBarController *)tabBarController withLeftViewController:(LeftMenuViewController *)leftViewController;

- (UINavigationController *)currentNavigationController;
- (YTVideoDetailViewController *)makeVideoDetailViewController:(id)video;

- (void)pushWithVideo:(id)video;
@end
