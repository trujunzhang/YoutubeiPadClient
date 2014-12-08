//
//  YTVideoDetailViewController.h
//  YoutubePlayApp
//
//  Created by djzhang on 10/20/14.
//  Copyright (c) 2014 djzhang. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import <MediaPlayer/MediaPlayer.h>
#import <YoutubeCollectionView/CollectionConstant.h>
#import "YoutubeConstants.h"

@class YKYouTubeVideo;

@class GGTabBarController;
@class YTAsVideoDetailViewController;
@protocol GridViewCellDelegate;


@interface YTVideoDetailViewController : UIViewController
@property(nonatomic, strong) UIViewController * selectedController;

@property(nonatomic, assign) id<GridViewCellDelegate> delegate;
@property(nonatomic, strong) YTYouTubeVideoCache * video;

@property(nonatomic, strong) YTAsVideoDetailViewController * videoDetailController;
@property(nonatomic, strong) GGTabBarController * videoTabBarController;

@property(nonatomic, strong) UIViewController * firstViewController;
@property(nonatomic, strong) UIViewController * secondViewController;
@property(nonatomic, strong) YTCollectionViewController * thirdViewController;

@property(nonatomic, strong) YKYouTubeVideo * youTubeVideo;
- (instancetype)initWithDelegate:(id<GridViewCellDelegate>)delegate video:(YTYouTubeVideoCache *)video;

@end


