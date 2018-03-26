//
//  SOMAAdViewDelegate.h
//  iSoma
//
//  Created by Aman Shaikh on 30/05/14.
//  Copyright (c) 2014 Smaato Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SOMAMediatedNetworkConfiguration.h"
#import "SOMAAdRenderer.h"

@class SOMAAdView;
@class SOMAVideoAdController;

@protocol SOMAAdViewDelegate <NSObject>
@optional
/**
 @brief Return a UIViewController instance that can present another view controller modally.
 
 @warning  Not implementing this method returning appropriate view controller might result in unusual behavior
 
 @attention If it is not implemented or return nil, banner will try to find a usable UIViewController but which may not work always depending the view hierarchy.
 
 */
- (UIViewController*)somaRootViewController;

#pragma mark - Methods for Ad Loading status
#pragma mark -
- (void)somaAdViewWillLoadAd:(SOMAAdView *)adview;
- (void)somaAdViewDidLoadAd:(SOMAAdView *)adview;
- (void)somaAdView:(SOMAAdView*) adview didFailToReceiveAdWithError:(NSError *)error;

#pragma mark - Methods for User Events
#pragma mark -
- (void)somaAdViewDidClick:(SOMAAdView *)adview;

- (void)somaAdViewWillEnterFullscreen:(SOMAAdView *)adview;
- (void)somaAdViewDidEnterFullscreen:(SOMAAdView *)adview;

- (void)somaAdViewWillExitFullscreen:(SOMAAdView *)adview;
- (void)somaAdViewDidExitFullscreen:(SOMAAdView *)adview;


- (void)somaAdViewApplicationWillGoBackground:(SOMAAdView *)adview;
- (void)somaAdViewApplicationDidBecomeActive:(SOMAAdView *)adview;

- (void)somaAdViewWillLeaveApplicationFromAd:(SOMAAdView *)adView;

#pragma mark - Methods for Toasters
#pragma mark -
- (void)somaAdViewWillHide:(SOMAAdView *)adview;
- (void)somaAdViewDidHide:(SOMAAdView *)adview;


#pragma mark - Methods for VAST tracking events
#pragma mark -
- (void)somaAdView:(SOMAAdView *)adview didReceiveVideoAdEvent:(SOMAVideoAdTrackingEvent)event;
- (void)somaAdView:(SOMAAdView *)adview didReceiveVideoAdEvent:(SOMAVideoAdTrackingEvent)event withURLCount:(NSUInteger)count;

#pragma mark - Informative optional methods
#pragma mark -
- (void)somaAdViewAutoRedirectionDetected:(SOMAAdView *)adview;
- (void)somaAdView:(SOMAAdView *)adview didReceivedMediationResponse:(NSArray*)networksWithStatus;
- (void)somaAdView:(SOMAAdView *)adview csm:(SOMAMediatedNetworkConfiguration*)network status:(NSString*)status;

#pragma mark - Deprecated methods
#pragma mark -
/**
 This method is deprectad. Please use @c somaAdViewWillEnterFullscreen.
 */
- (BOOL)somaAdViewShouldEnterFullscreen:(SOMAAdView *)adview DEPRECATED_ATTRIBUTE;

@end
