//
//  YoutubePopUpViewControllerBase.m
//  TubeIPadApp
//
//  Created by djzhang on 11/21/14.
//  Copyright (c) 2014 djzhang. All rights reserved.
//

#import "YoutubePopUpViewControllerBase.h"
#import "YoutubePopUpTableViewController.h"


@interface YoutubePopUpViewControllerBase ()<UIPopoverControllerDelegate, YoutubePopUpTableViewDelegate> {

}
@property(nonatomic, strong) YoutubePopUpTableViewController * popUpTableViewController;
@property(nonatomic, strong) UIPopoverController * popover;

@end


@implementation YoutubePopUpViewControllerBase


- (void)viewDidLoad {
   [super viewDidLoad];

   self.popUpTableViewController = [[YoutubePopUpTableViewController alloc] init];
   self.popUpTableViewController.popupDelegate = self;
}


#pragma mark -
#pragma mark


- (void)hidePopup {
   if (self.popover) {
      [self.popover dismissPopoverAnimated:YES];
      self.popover = nil;
   }

}


- (void)showPopupDialog:(UIBarButtonItem *)item {
   if (self.popover)
      return;

   self.popover = [[UIPopoverController alloc] initWithContentViewController:self.popUpTableViewController];
   self.popover.delegate = self;

   [self.popover presentPopoverFromBarButtonItem:item
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
}


#pragma mark -
#pragma mark


- (void)cleanUpContent {
   [self.popUpTableViewController empty];
}


- (void)reloadContent:(NSArray *)array {
   [self.popUpTableViewController resetTableSource:array];
}


#pragma mark - Popover Controller Delegate


- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
   self.popover = nil;
}


@end
