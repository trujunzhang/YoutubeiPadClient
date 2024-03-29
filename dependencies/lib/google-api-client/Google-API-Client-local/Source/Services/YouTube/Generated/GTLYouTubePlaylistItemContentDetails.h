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
//  GTLYouTubePlaylistItemContentDetails.h
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
//   GTLYouTubePlaylistItemContentDetails (0 custom class methods, 4 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

// ----------------------------------------------------------------------------
//
//   GTLYouTubePlaylistItemContentDetails
//

@interface GTLYouTubePlaylistItemContentDetails : GTLObject

// The time, measured in seconds from the start of the detailVideo, when the detailVideo
// should stop playing. (The playlist owner can specify the times when the detailVideo
// should start and stop playing when the detailVideo is played in the context of the
// playlist.) By default, assume that the detailVideo.endTime is the end of the detailVideo.
@property (copy) NSString *endAt;

// A user-generated note for this item.
@property (copy) NSString *note;

// The time, measured in seconds from the start of the detailVideo, when the detailVideo
// should start playing. (The playlist owner can specify the times when the
// detailVideo should start and stop playing when the detailVideo is played in the context
// of the playlist.) The default value is 0.
@property (copy) NSString *startAt;

// The ID that YouTube uses to uniquely identify a detailVideo. To retrieve the detailVideo
// resource, set the id query parameter to this value in your API request.
@property (copy) NSString *videoId;

@end
