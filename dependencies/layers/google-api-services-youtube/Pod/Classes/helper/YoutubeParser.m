//
//  YoutubeParser.m
//  IOSTemplate
//
//  Created by djzhang on 11/15/14.
//  Copyright (c) 2014 djzhang. All rights reserved.
//

#import "MABYT3_APIRequest.h"
#import "YoutubeParser.h"
#import "ISMemoryCache.h"
#import "RXMatch.h"
#import "NSString+Regexer.h"
#import "YoutubeVideoDescriptionStringAttribute.h"


@interface YoutubeParser ()

@end


@implementation YoutubeParser


+ (NSString *)getVideoIdsByActivityList:searchResultList {
   NSMutableArray * videoIds = [[NSMutableArray alloc] init];
   for (YTYouTubeActivity * searchResult in searchResultList) {
      NSString * videoId = [YoutubeParser getvideoIdByActivity:searchResult.contentDetails];
      if (videoId)
         [videoIds addObject:videoId];
   }
   return [videoIds componentsJoinedByString:@","];
}


+ (NSString *)getvideoIdByActivity:(YTYouTubeActivityContentDetails *)contentDetails {

   NSArray * resourceArray = [NSArray arrayWithObjects:
    contentDetails.upload,
    contentDetails.like,
    contentDetails.favorite,
     nil];


   for (YTYouTubeResourceId * resourceId in resourceArray) {
      if (![resourceId.videoId isEqualToString:@""])
         return resourceId.videoId;
   }

   return nil;
}


+ (NSString *)getVideoIdsBySearchResult:(NSMutableArray *)searchResultList {
   NSMutableArray * videoIds = [[NSMutableArray alloc] init];
   for (YTYouTubeSearchResult * searchResult in searchResultList) {
      if (debugCollectionViewToDetail) {
         // pXvzypp8mlo
         // 58kDMw779xc
         // pXvzypp8mlo
         [videoIds addObject:@"82urkb3mJaQ"];// test
      } else {
         [videoIds addObject:searchResult.identifier.videoId];// used
      }
   }
   return [videoIds componentsJoinedByString:@","];
}


#pragma mark -
#pragma mark Subscription


+ (NSString *)getChannelIdBySubscription:(YTYouTubeSubscription *)subscription {
   return subscription.snippet.resourceId.JSON[@"channelId"];
}


+ (NSString *)getSubscriptionSnippetThumbnailUrl:(YTYouTubeSubscription *)subscription {
   return subscription.snippet.thumbnails.high.url;
}


+ (NSString *)getSubscriptionSnippetTitle:(YTYouTubeSubscription *)subscription {
   return subscription.snippet.title;
}


#pragma mark -
#pragma mark  Video cache


+ (NSString *)getVideoSnippetThumbnails:(YTYouTubeVideoCache *)video {
   return video.snippet.thumbnails.medium.url;
}


+ (NSString *)getWatchVideoId:(YTYouTubeVideoCache *)video {
   return video.identifier;
}


+ (NSString *)getChannelIdByVideo:(YTYouTubeVideoCache *)video {
   return video.snippet.channelId;
}


+ (NSString *)getVideoSnippetTitle:(YTYouTubeVideoCache *)video {
   return video.snippet.title;
}


+ (NSString *)getVideoStatisticsViewCount:(YTYouTubeVideoCache *)video {
   NSNumber * number = video.statistics.viewCount;

   NSNumberFormatter * formatter = [NSNumberFormatter new];
   [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
   NSString * newString = [formatter stringFromNumber:[NSNumber numberWithInteger:number]];

   return [NSString stringWithFormat:@"%@ views", newString];
}


+ (NSString *)getVideoStatisticsLikeCount:(YTYouTubeVideoCache *)video {
   NSNumber * likeCount = video.statistics.likeCount;
   NSNumber * dislikeCount = video.statistics.dislikeCount;

   return [NSString stringWithFormat:@"%d likes, %d dislikes", [likeCount intValue], [dislikeCount intValue]];
}


+ (NSString *)getVideoDescription:(YTYouTubeVideoCache *)video {
   return video.snippet.descriptionString;
}


+ (NSString *)getVideoSnippetChannelTitle:(YTYouTubeVideoCache *)video {
   return video.snippet.channelTitle;
}


+ (NSString *)getVideoSnippetChannelPublishedAt:(YTYouTubeVideoCache *)video {
   return video.snippet.publishedAt.min_string;
}


+ (NSString *)getVideoDurationForVideoInfo:(YTYouTubeVideoCache *)video {
   NSString * durationString = [YoutubeParser parseISO8601Duration:video.contentDetails.duration];
//   NSLog(@"durationString = %@", durationString);
   return [NSString stringWithFormat:@" %@ ", durationString];
}


+ (void)parseDescriptionStringWithRegExp:(YTYouTubeVideoCache *)videoCache {
   NSString * videoDescription = [YoutubeParser getVideoDescription:videoCache];

   NSMutableString * address = [[NSMutableString alloc] initWithString:videoDescription];

   address = [address stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
   address = [address stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];

   NSUInteger i = [@"\n" length];
   NSUInteger length = [@" " length];

   NSString * pattern = @"[a-zA-z]+://[^\\s]*";
   NSArray * matches = [address rx_matchesWithPattern:pattern];

   int step = 0;
   NSMutableArray * descriptionStringAttributeArray = [[NSMutableArray alloc] init];
   for (RXMatch * match in matches) {
      YoutubeVideoDescriptionStringAttribute * youtubeVideoDescriptionStringAttribute = [[YoutubeVideoDescriptionStringAttribute alloc] init];

      NSString * httpString = [match text];
      NSRange httpRang = [match range];
      NSLog(@"Text: %@, Range: [location: %d, length: %d]", httpString,
       httpRang.location, httpRang.length);

      // 1
      NSString * kLinkAttributeName = [NSString stringWithFormat:@"VideoDetailNodeLinkAttributeName_%02d", step++];
      youtubeVideoDescriptionStringAttribute.kLinkAttributeName = kLinkAttributeName;
      youtubeVideoDescriptionStringAttribute.httpString = httpString;
      youtubeVideoDescriptionStringAttribute.httpRang = httpRang;

      [descriptionStringAttributeArray addObject:youtubeVideoDescriptionStringAttribute];
   }

   videoCache.descriptionStringAttributeArray = descriptionStringAttributeArray;
}


#pragma mark -
#pragma mark Channel for other request


+ (NSString *)getChannelBannerImageUrl:(YTYouTubeChannel *)channel {
   NSString * imageUrl = channel.brandingSettings.image.bannerMobileMediumHdImageUrl;
   if (imageUrl)
      return imageUrl;

   return channel.brandingSettings.image.bannerImageUrl;
}


+ (NSArray *)getChannelBannerImageUrlArray:(YTYouTubeChannel *)channel {
   NSString * lowUrl = channel.brandingSettings.image.bannerMobileLowImageUrl;
   NSString * mediumUrl = channel.brandingSettings.image.bannerMobileMediumHdImageUrl;
   NSString * hdUrl = channel.brandingSettings.image.bannerMobileHdImageUrl;
   if ([mediumUrl isEqualToString:@""] == NO) {
      return @[
       lowUrl, mediumUrl, hdUrl
      ];
   }

   return @[
    @"",
    @"",
    channel.brandingSettings.image.bannerImageUrl,
   ];
}


+ (NSString *)getChannelSnippetThumbnail:(YTYouTubeChannel *)channel {
   YTYouTubeMABThumbmail * thumbnail = channel.snippet.thumbnails[@"default"];
   return thumbnail.url;
}


+ (NSString *)getChannelBrandingSettingsTitle:(YTYouTubeChannel *)channel {
   return channel.brandingSettings.channel.title;
}


+ (NSString *)getChannelStatisticsSubscriberCount:(YTYouTubeChannel *)channel {
   unsigned long subscriberCount = channel.statistics.subscriberCount;
   return [NSString stringWithFormat:@"%d subscribers", subscriberCount];
}


#pragma mark -
#pragma mark Channel for author


+ (NSString *)getAuthChannelSnippetThumbnailUrl:(YTYouTubeAuthorChannel *)channel {
   return channel.snippet.thumbnails.high.url;
}


+ (NSString *)getAuthChannelTitle:(YTYouTubeAuthorChannel *)channel {
   return channel.snippet.title;
}


+ (NSString *)getAuthChannelID:(YTYouTubeAuthorChannel *)channel {
   return channel.identifier;
}


+ (GTLYouTubeChannelContentDetailsRelatedPlaylists *)getAuthChannelRelatedPlaylists:(YTYouTubeAuthorChannel *)channel {
   return channel.contentDetails.relatedPlaylists;
}


+ (NSError *)getError:(NSData *)data httpresp:(NSHTTPURLResponse *)httpresp {
   NSError * error;
   NSError * e = nil;
   NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingMutableContainers
                                                           error:&e];
   if ([dict objectForKey:@"error"]) {
      NSDictionary * dict2 = [dict objectForKey:@"error"];
      if ([dict2 objectForKey:@"errors"]) {
         NSArray * items = [dict2 objectForKey:@"errors"];
         if (items.count > 0) {
            NSString * dom = @"YTAPI";
            if ([items[0] objectForKey:@"domain"]) {
               dom = [items[0] objectForKey:@"domain"];
            }
            error = [NSError errorWithDomain:dom
                                        code:httpresp.statusCode
                                    userInfo:items[0]];
         }
      }
   }
   return error;
}


+ (NSString *)parseISO8601Duration:(NSString *)duration {
//   NSString * duration = @"P1DT10H15M49S";

   int i = 0, days = 0, hours = 0, minutes = 0, seconds = 0;

   while (i < duration.length) {
      NSString * str = [duration substringWithRange:NSMakeRange(i, duration.length - i)];

      i++;

      if ([str hasPrefix:@"P"] || [str hasPrefix:@"T"])
         continue;

      NSScanner * sc = [NSScanner scannerWithString:str];
      int value = 0;

      if ([sc scanInt:&value]) {
         i += [sc scanLocation] - 1;

         str = [duration substringWithRange:NSMakeRange(i, duration.length - i)];

         i++;

         if ([str hasPrefix:@"D"])
            days = value;
         else if ([str hasPrefix:@"H"])
            hours = value;
         else if ([str hasPrefix:@"M"])
            minutes = value;
         else if ([str hasPrefix:@"S"])
            seconds = value;
      }
   }

   if (hours == 0) {
      return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
   }
   return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}


#pragma mark -
#pragma mark Url cache


+ (void)cacheWithKey:(NSString *)key withValue:(NSString *)value {
   [[ISMemoryCache sharedCache] setObject:value forKey:key];
}


+ (NSString *)checkAndAppendThumbnailWithChannelId:(NSString *)key {
   return [[ISMemoryCache sharedCache] objectForKey:key];
}


@end
