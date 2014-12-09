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
//  GTLYouTubeVideo.h
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
//   GTLYouTubeVideo (0 custom class methods, 18 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

@class GTLYouTubeVideoAgeGating;
@class GTLYouTubeVideoContentDetails;
@class GTLYouTubeVideoConversionPings;
@class GTLYouTubeVideoFileDetails;
@class GTLYouTubeVideoLiveStreamingDetails;
@class GTLYouTubeVideoMonetizationDetails;
@class GTLYouTubeVideoPlayer;
@class GTLYouTubeVideoProcessingDetails;
@class GTLYouTubeVideoProjectDetails;
@class GTLYouTubeVideoRecordingDetails;
@class GTLYouTubeVideoSnippet;
@class GTLYouTubeVideoStatistics;
@class GTLYouTubeVideoStatus;
@class GTLYouTubeVideoSuggestions;
@class GTLYouTubeVideoTopicDetails;

// ----------------------------------------------------------------------------
//
//   GTLYouTubeVideo
//

// A detailVideo resource represents a YouTube detailVideo.

@interface GTLYouTubeVideo : GTLObject

// Age restriction details related to a detailVideo.
@property (retain) GTLYouTubeVideoAgeGating *ageGating;

// The contentDetails object contains information about the detailVideo content,
// including the length of the detailVideo and its aspect ratio.
@property (retain) GTLYouTubeVideoContentDetails *contentDetails;

// The conversionPings object encapsulates information about url pings that need
// to be respected by the App in different detailVideo contexts.
@property (retain) GTLYouTubeVideoConversionPings *conversionPings;

// Etag of this resource.
@property (copy) NSString *ETag;

// The fileDetails object encapsulates information about the detailVideo file that was
// uploaded to YouTube, including the file's resolution, duration, audio and
// detailVideo codecs, stream bitrates, and more. This data can only be retrieved by
// the detailVideo owner.
@property (retain) GTLYouTubeVideoFileDetails *fileDetails;

// The ID that YouTube uses to uniquely identify the detailVideo.
// identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
@property (copy) NSString *identifier;

// Identifies what kind of resource this is. Value: the fixed string
// "youtube#detailVideo".
@property (copy) NSString *kind;

// The liveStreamingDetails object contains metadata about a live detailVideo
// broadcast. The object will only be present in a detailVideo resource if the detailVideo
// is an upcoming, live, or completed live broadcast.
@property (retain) GTLYouTubeVideoLiveStreamingDetails *liveStreamingDetails;

// The monetizationDetails object encapsulates information about the
// monetization status of the detailVideo.
@property (retain) GTLYouTubeVideoMonetizationDetails *monetizationDetails;

// The player object contains information that you would use to play the detailVideo
// in an embedded player.
@property (retain) GTLYouTubeVideoPlayer *player;

// The processingProgress object encapsulates information about YouTube's
// progress in processing the uploaded detailVideo file. The properties in the object
// identify the current processing status and an estimate of the time remaining
// until YouTube finishes processing the detailVideo. This part also indicates whether
// different types of data or content, such as file details or thumbnail images,
// are available for the detailVideo.
// The processingProgress object is designed to be polled so that the detailVideo
// uploaded can track the progress that YouTube has made in processing the
// uploaded detailVideo file. This data can only be retrieved by the detailVideo owner.
@property (retain) GTLYouTubeVideoProcessingDetails *processingDetails;

// The projectDetails object contains information about the project specific
// detailVideo metadata.
@property (retain) GTLYouTubeVideoProjectDetails *projectDetails;

// The recordingDetails object encapsulates information about the location, date
// and address where the detailVideo was recorded.
@property (retain) GTLYouTubeVideoRecordingDetails *recordingDetails;

// The snippet object contains basic details about the detailVideo, such as its title,
// description, and category.
@property (retain) GTLYouTubeVideoSnippet *snippet;

// The statistics object contains statistics about the detailVideo.
@property (retain) GTLYouTubeVideoStatistics *statistics;

// The status object contains information about the detailVideo's uploading,
// processing, and privacy statuses.
@property (retain) GTLYouTubeVideoStatus *status;

// The suggestions object encapsulates suggestions that identify opportunities
// to improve the detailVideo quality or the metadata for the uploaded detailVideo. This
// data can only be retrieved by the detailVideo owner.
@property (retain) GTLYouTubeVideoSuggestions *suggestions;

// The topicDetails object encapsulates information about Freebase topics
// associated with the detailVideo.
@property (retain) GTLYouTubeVideoTopicDetails *topicDetails;

@end
