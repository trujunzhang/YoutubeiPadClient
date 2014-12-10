//
// Created by djzhang on 12/10/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "ASControlNode+Subclasses.h"
#import "ASDisplayNode+Subclasses.h"

#include "YoutubeConstants.h"

@interface YTAsRowNode :ASDisplayNode

@property(nonatomic, strong) YTYouTubeVideoCache * video;

@end