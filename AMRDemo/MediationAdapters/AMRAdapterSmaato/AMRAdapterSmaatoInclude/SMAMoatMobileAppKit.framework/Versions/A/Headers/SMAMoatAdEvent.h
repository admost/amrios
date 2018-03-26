//
//  MoatAdEvent.h
//  MoatMobileAppKit
//
//  Created by Moat on 2/5/16.
//  Copyright © 2016 Moat. All rights reserved.
//
//  This class is simply a data object that encapsulates info relevant to a particular playback event.

#import <Foundation/Foundation.h>

typedef enum SMAMoatAdEventType : NSUInteger {
    SMAMoatAdEventComplete
    , SMAMoatAdEventStart
    , SMAMoatAdEventFirstQuartile
    , SMAMoatAdEventMidPoint
    , SMAMoatAdEventThirdQuartile
    , SMAMoatAdEventSkipped
    , SMAMoatAdEventStopped
    , SMAMoatAdEventPaused
    , SMAMoatAdEventPlaying
    , SMAMoatAdEventVolumeChange
    , SMAMoatAdEventNone
} SMAMoatAdEventType;

static NSTimeInterval const SMAMoatTimeUnavailable = NAN;
static float const SMAMoatVolumeUnavailable = NAN;

@interface SMAMoatAdEvent : NSObject

@property SMAMoatAdEventType eventType;
@property NSTimeInterval adPlayhead;
@property float adVolume;
@property (readonly) NSTimeInterval timeStamp;

- (id)initWithType:(SMAMoatAdEventType)eventType withPlayheadMillis:(NSTimeInterval)playhead;
- (id)initWithType:(SMAMoatAdEventType)eventType withPlayheadMillis:(NSTimeInterval)playhead withVolume:(float)volume;
- (NSDictionary *)asDict;
- (NSString *)eventAsString;

@end
