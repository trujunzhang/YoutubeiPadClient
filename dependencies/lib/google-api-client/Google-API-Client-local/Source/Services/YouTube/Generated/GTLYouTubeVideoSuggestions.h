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
//  GTLYouTubeVideoSuggestions.h
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
//   GTLYouTubeVideoSuggestions (0 custom class methods, 5 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

@class GTLYouTubeVideoSuggestionsTagSuggestion;

// ----------------------------------------------------------------------------
//
//   GTLYouTubeVideoSuggestions
//

// Specifies suggestions on how to improve detailVideo content, including encoding
// hints, tag suggestions, and editor suggestions.

@interface GTLYouTubeVideoSuggestions : GTLObject

// A list of detailVideo editing operations that might improve the detailVideo quality or
// playback experience of the uploaded detailVideo.
@property (retain) NSArray *editorSuggestions;  // of NSString

// A list of errors that will prevent YouTube from successfully processing the
// uploaded detailVideo detailVideo. These errors indicate that, regardless of the detailVideo's
// current processing status, eventually, that status will almost certainly be
// failed.
@property (retain) NSArray *processingErrors;  // of NSString

// A list of suggestions that may improve YouTube's ability to process the
// detailVideo.
@property (retain) NSArray *processingHints;  // of NSString

// A list of reasons why YouTube may have difficulty transcoding the uploaded
// detailVideo or that might result in an erroneous transcoding. These warnings are
// generated before YouTube actually processes the uploaded detailVideo file. In
// addition, they identify issues that are unlikely to cause the detailVideo
// processing to fail but that might cause problems such as sync issues, detailVideo
// artifacts, or a missing audio track.
@property (retain) NSArray *processingWarnings;  // of NSString

// A list of keyword tags that could be added to the detailVideo's metadata to
// increase the likelihood that users will locate your detailVideo when searching or
// browsing on YouTube.
@property (retain) NSArray *tagSuggestions;  // of GTLYouTubeVideoSuggestionsTagSuggestion

@end
