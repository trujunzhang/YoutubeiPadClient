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



@interface YTVideoDetailViewController : UIViewController



- (instancetype)initWithVideo:(YTYouTubeVideoCache *)video;

@end


