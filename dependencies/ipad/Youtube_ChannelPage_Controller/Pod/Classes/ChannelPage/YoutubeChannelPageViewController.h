//
//  YoutubeChannelPageViewController.h
//  IOSTemplate
//
//  Created by djzhang on 11/12/14.
//  Copyright (c) 2014 djzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionConstant.h"

@interface YoutubeChannelPageViewController : UIViewController

@property(nonatomic, assign) id<GridViewCellDelegate> delegate;

- (instancetype)initWithChannelId:(NSString *)channelId;

@end