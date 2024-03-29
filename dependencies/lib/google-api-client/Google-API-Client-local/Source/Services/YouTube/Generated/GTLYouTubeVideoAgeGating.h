/* Copyright (c) 2013 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//
//  GTLYouTubeVideoAgeGating.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   YouTube Data API (youtube/v3)
// Description:
//   Programmatic access to YouTube features.
// Documentation:
//   https://developers.google.com/youtube/v3
// Classes:
//   GTLYouTubeVideoAgeGating (0 custom class methods, 3 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

// ----------------------------------------------------------------------------
//
//   GTLYouTubeVideoAgeGating
//

@interface GTLYouTubeVideoAgeGating : GTLObject

// Indicates whether or not the detailVideo has alcoholic beverage content. Only users
// of legal purchasing age in a particular country, as identified by ICAP, can
// view the content.
@property (retain) NSNumber *alcoholContent;  // boolValue

// Age-restricted trailers. For redband trailers and adult-rated detailVideo-games.
// Only users aged 18+ can view the content. The the field is true the content
// is restricted to viewers aged 18+. Otherwise The field won't be present.
@property (retain) NSNumber *restricted;  // boolValue

// Video game rating, if any.
@property (copy) NSString *videoGameRating;

@end
