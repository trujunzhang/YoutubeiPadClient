//
//  YTAsyncGridViewVideoNode.h
//  Layers
//
//  Created by djzhang on 11/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AsyncDisplayKit.h"
#import "YoutubeConstants.h"

@protocol GridViewCellDelegate;


@interface YTAsyncGridViewVideoNode : ASDisplayNode

@property(nonatomic) CGSize const nodeCellSize;

@property(nonatomic, strong) YTYouTubeVideoCache * cardInfo;

@property(nonatomic, strong) id<GridViewCellDelegate> delegate;

- (instancetype)initWithCardInfo:(YTYouTubeVideoCache *)cardInfo cellSize:(CGSize)cellSize delegate:(id<GridViewCellDelegate>)delegate isBacked:(BOOL)isBacked;
@end
