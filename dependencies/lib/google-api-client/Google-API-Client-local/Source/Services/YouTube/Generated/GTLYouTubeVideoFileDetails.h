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
//  GTLYouTubeVideoFileDetails.h
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
//   GTLYouTubeVideoFileDetails (0 custom class methods, 10 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

@class GTLYouTubeGeoPoint;
@class GTLYouTubeVideoFileDetailsAudioStream;
@class GTLYouTubeVideoFileDetailsVideoStream;

// ----------------------------------------------------------------------------
//
//   GTLYouTubeVideoFileDetails
//

// Describes original detailVideo file properties, including technical details about
// audio and detailVideo streams, but also metadata information like content length,
// digitization time, or geotagging information.

@interface GTLYouTubeVideoFileDetails : GTLObject

// A list of audio streams contained in the uploaded detailVideo file. Each item in
// the list contains detailed metadata about an audio stream.
@property (retain) NSArray *audioStreams;  // of GTLYouTubeVideoFileDetailsAudioStream

// The uploaded detailVideo file's combined (detailVideo and audio) bitrate in bits per
// second.
@property (retain) NSNumber *bitrateBps;  // unsignedLongLongValue

// The uploaded detailVideo file's container format.
@property (copy) NSString *container;

// The date and time when the uploaded detailVideo file was created. The value is
// specified in ISO 8601 format. Currently, the following ISO 8601 formats are
// supported:
// - Date only: YYYY-MM-DD
// - Naive time: YYYY-MM-DDTHH:MM:SS
// - Time with timezone: YYYY-MM-DDTHH:MM:SS+HH:MM
@property (copy) NSString *creationTime;

// The length of the uploaded detailVideo in milliseconds.
@property (retain) NSNumber *durationMs;  // unsignedLongLongValue

// The uploaded file's name. This field is present whether a detailVideo file or
// another type of file was uploaded.
@property (copy) NSString *fileName;

// The uploaded file's size in bytes. This field is present whether a detailVideo file
// or another type of file was uploaded.
@property (retain) NSNumber *fileSize;  // unsignedLongLongValue

// The uploaded file's type as detected by YouTube's detailVideo processing engine.
// Currently, YouTube only processes detailVideo files, but this field is present
// whether a detailVideo file or another type of file was uploaded.
@property (copy) NSString *fileType;

// Geographic coordinates that identify the place where the uploaded detailVideo was
// recorded. Coordinates are defined using WGS 84.
@property (retain) GTLYouTubeGeoPoint *recordingLocation;

// A list of detailVideo streams contained in the uploaded detailVideo file. Each item in
// the list contains detailed metadata about a detailVideo stream.
@property (retain) NSArray *videoStreams;  // of GTLYouTubeVideoFileDetailsVideoStream

@end
