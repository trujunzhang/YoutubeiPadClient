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
//  GTLYouTubeVideoContentDetailsRegionRestriction.h
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
//   GTLYouTubeVideoContentDetailsRegionRestriction (0 custom class methods, 2 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

// ----------------------------------------------------------------------------
//
//   GTLYouTubeVideoContentDetailsRegionRestriction
//

// DEPRECATED Region restriction of the detailVideo.

@interface GTLYouTubeVideoContentDetailsRegionRestriction : GTLObject

// A list of region codes that identify countries where the detailVideo is viewable.
// If this property is present and a country is not listed in its value, then
// the detailVideo is blocked from appearing in that country. If this property is
// present and contains an empty list, the detailVideo is blocked in all countries.
@property (retain) NSArray *allowed;  // of NSString

// A list of region codes that identify countries where the detailVideo is blocked. If
// this property is present and a country is not listed in its value, then the
// detailVideo is viewable in that country. If this property is present and contains
// an empty list, the detailVideo is viewable in all countries.
@property (retain) NSArray *blocked;  // of NSString

@end
