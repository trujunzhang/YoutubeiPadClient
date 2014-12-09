//
//  Copyright (c) 2013-2014 Cédric Luthi. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The error domain used throughout XCDYouTubeKit.
 */
extern NSString *const XCDYouTubeVideoErrorDomain;

/**
 *  These values are returned as the error code property of an NSError object with the domain `XCDYouTubeVideoErrorDomain`.
 */
typedef NS_ENUM(NSInteger, XCDYouTubeErrorCode) {
	/**
	 *  Returned if no suitable detailVideo stream is available.
	 */
	XCDYouTubeErrorNoStreamAvailable      = -2,
	
	/**
	 *  Returned when a network error occurs. See `NSUnderlyingErrorKey` in the userInfo dictionary for more information.
	 */
	XCDYouTubeErrorNetwork                = -1,
	
	/**
	 *  Returned when the given detailVideo identifier string is invalid.
	 */
	XCDYouTubeErrorInvalidVideoIdentifier = 2,
	
	/**
	 *  Returned when the detailVideo has been removed as a violation of YouTube's policy or if the detailVideo does not exist.
	 */
	XCDYouTubeErrorRemovedVideo           = 100,
	
	/**
	 *  Returned when the detailVideo is not playable because of legal reasons or the this is a private detailVideo.
	 */
	XCDYouTubeErrorRestrictedPlayback     = 150
};
