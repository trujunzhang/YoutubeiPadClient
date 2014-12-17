//
//  LeftMenuViewController.m
//  STCollapseTableViewDemo
//
//  Created by Thomas Dupont on 09/08/13.
//  Copyright (c) 2013 iSofTom. All rights reserved.
//


#import "LeftMenuViewController.h"

#import "LeftMenuViewBase.h"
#import "STCollapseTableView.h"
#import "GYoutubeAuthUser.h"
#import "LeftMenuItemTree.h"
#import "LeftMenuTableHeaderView.h"
#import "YTLeftRowTableViewCell.h"
#import "YoutubeParser.h"
#import "YTAsLeftTableCellNode.h"

static CGFloat ROW_HEIGHT = 142;


@interface LeftMenuViewController ()<ASTableViewDataSource, ASTableViewDelegate>
@property(nonatomic, strong) ASTableView * tableView;


@end


@implementation LeftMenuViewController


- (instancetype)init {
   if (!(self = [super init]))
      return nil;

   self.tableView = [[ASTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
   self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; // KittenNode has its own separator
   self.tableView.asyncDataSource = self;
   self.tableView.asyncDelegate = self;


   return self;
}


#pragma mark -
#pragma mark UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return [self.tableSectionArray count];
}


- (ASCellNode *)tableView:(ASTableView *)tableView nodeForRowAtIndexPath:(NSIndexPath *)indexPath {

   LeftMenuItemTree * menuItemTree = self.tableSectionArray[indexPath.section];
   NSArray * line = menuItemTree.rowsArray[indexPath.row];


   YTAsLeftTableCellNode * node =
    [[YTAsLeftTableCellNode alloc]
     initWithNodeCellSize:CGSizeMake(250, ROW_HEIGHT)
                lineTitle:[LeftMenuItemTree getTitleInRow:line]
              lineIconUrl:[LeftMenuItemTree getThumbnailUrlInRow:line]
            isRemoteImage:menuItemTree.isRemoteImage];

   return node;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   LeftMenuItemTree * menuItemTree = self.tableSectionArray[section];

   return menuItemTree.rowsArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
   LeftMenuItemTree * menuItemTree = self.tableSectionArray[section];
   if (menuItemTree.hideTitle) {
      return 0;
   }

   return 42;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   return [self.headers objectAtIndex:section];
}


#pragma mark -
#pragma mark UITableViewDelegate


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//   NSInteger section = indexPath.section;
//   NSInteger row = indexPath.row;
//
//   LeftMenuItemTree * menuItemTree = self.tableSectionArray[section];
//   NSArray * line = menuItemTree.rowsArray[row];
//
//   LeftMenuItemTreeType itemType = menuItemTree.itemType;
//   switch (itemType) {
//      case LMenuTreeUser:
//         [self.delegate startToggleLeftMenuWithTitle:[LeftMenuItemTree getTitleInRow:line]
//                                            withType:[LeftMenuItemTree getTypeInRow:line]];
//         break;
//      case LMenuTreeSubscriptions: {
//         [self.delegate endToggleLeftMenuEventForChannelPageWithChannelId:[LeftMenuItemTree getChannelIdUrlInRow:line]
//                                                                withTitle:[LeftMenuItemTree getTitleInRow:line]];
//      }
//         break;
//      case LMenuTreeCategories: {
//      }
//   }
//}


#pragma mark -
#pragma mark


- (void)viewDidLoad {
   [self setCurrentTableView:self.tableView];
   [self defaultRefreshForSubscriptionList];

   [super viewDidLoad];
}


- (void)viewWillLayoutSubviews {
   _tableView.frame = self.view.bounds;
}


@end
