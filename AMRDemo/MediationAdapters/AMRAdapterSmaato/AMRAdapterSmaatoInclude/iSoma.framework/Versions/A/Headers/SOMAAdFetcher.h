//
//  SOMAAdFetcher.h
//  iSoma
//
//  Created by Aman Shaikh on 23/06/14.
//  Copyright (c) 2014 Smaato Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SOMAAdParser.h"

@class SOMAAd;


typedef void(^SOMAAdFetcherCallback)(id ad, NSError* error);

@protocol SOMAAdFetcher <NSObject>
@property(nonatomic, strong) id<SOMAAdParser> parser;
@required
- (instancetype) initWithAdRequest:(NSURLRequest*)request;
- (void)fetch:(SOMAAdFetcherCallback)callback;
- (void)fetch:(NSURL*)url withCallback:(SOMAAdFetcherCallback)callback;
- (void)parse:(NSData*)data withResponse:(NSURLResponse*)response callback:(SOMAAdFetcherCallback)callback;
@end
