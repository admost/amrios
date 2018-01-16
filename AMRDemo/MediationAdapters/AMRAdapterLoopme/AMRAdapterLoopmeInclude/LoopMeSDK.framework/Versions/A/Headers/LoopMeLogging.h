//
//  LoopMeUtility.m
//  LoopMeSDK
//
//  Copyright (c) 2012 LoopMe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LoopMeLogLevel) {
    LoopMeLogLevelError  = 0,
    LoopMeLogLevelDebug  = 10,
    LoopMeLogLevelInfo   = 20,
    LoopMeLogLevelOff    = 30,
};

LoopMeLogLevel getLoopMeLogLevel(void);
void setLoopMeLogLevel(LoopMeLogLevel level);

void LoopMeLogDebug(NSString *format, ...);
void LoopMeLogInfo(NSString *format, ...);
void LoopMeLogError(NSString *format, ...);

@interface LoopMeLoggingSender : NSObject

@property (nonatomic) NSTimeInterval videoLoadingTimeInterval;

+ (LoopMeLoggingSender *)sharedInstance;
- (void)writeLog:(NSString *)msg;

@end
