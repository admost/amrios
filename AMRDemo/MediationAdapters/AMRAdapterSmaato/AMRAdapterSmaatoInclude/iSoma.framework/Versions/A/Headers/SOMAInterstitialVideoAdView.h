//
//  SOMAInterstitialVideoAdView.h
//  iSoma
//
//  Created by Aman Shaikh on 02/12/14.
//  Copyright (c) 2014 Smaato Inc. All rights reserved.
//

#import "SOMAInterstitialAdView.h"
@class SOMAVideoAd;
@interface SOMAInterstitialVideoAdView : SOMAInterstitialAdView
@property NSURL* vastURL;
- (SOMAVideoAd*)currentAd;
@end
