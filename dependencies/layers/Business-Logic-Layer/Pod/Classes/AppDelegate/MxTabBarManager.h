#import <UIKit/UIKit.h>
@class YTVideoDetailViewController;
@class LeftMenuViewController;


@interface MxTabBarManager : NSObject

+ (MxTabBarManager *)sharedTabBarManager;

- (void)registerTabBarController:(UITabBarController *)tabBarController withLeftViewController:(LeftMenuViewController *)leftViewController;

- (void)setLeftMenuControllerDelegate:(id)delegate;
- (UINavigationController *)currentNavigationController;
- (YTVideoDetailViewController *)makeVideoDetailViewController:(id)video;

- (void)pushAndResetControllers:(NSArray *)controllers;
- (void)pushWithVideo:(id)video;
@end
