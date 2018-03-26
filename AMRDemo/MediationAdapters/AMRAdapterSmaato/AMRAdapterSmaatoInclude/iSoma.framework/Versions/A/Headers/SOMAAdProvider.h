//
//  SOMADefaultAdProvider.h
//  iSoma
//
//  Created by Aman Shaikh on 23/06/14.
//  Copyright (c) 2014 Smaato Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SOMAAdProviderDelegate.h"

@class SOMAAdSettings;
@protocol SOMAAdFetcher;

@interface SOMAAdProvider : NSObject
@property SOMAAd* ad;
@property(nonatomic, weak) SOMAAdSettings* settings;
@property(nonatomic, strong) NSURL* passbackURL;
@property(nonatomic, weak) id<SOMAAdProviderDelegate> delegate;

// This is added to mock ad fetcher
@property(nonatomic, strong) id<SOMAAdFetcher> fetcher;


-(void)pause;
-(void)resume:(BOOL)shouldWaitForIntervalDuration;
@end
