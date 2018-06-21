//
//  SOMAVideoAdController.h
//  iSoma
//
//  Created by Aman Shaikh on 24/01/2017.
//  Copyright © 2017 Smaato Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SOMAAdSettings.h"
#import "SOMAAdViewDelegate.h"
@class SOMAVideoAd;
@class SOMAVideoAdController;
@protocol SOMAVideoAdControllerDelegate <NSObject>
- (void)somaVideoAdDidLoadAd:(SOMAVideoAdController *)adview;
- (void)somaVideoAd:(SOMAVideoAdController*) adview didFailToReceiveAdWithError:(NSError *)error;

@optional
- (UIViewController*)somaRootViewController;
- (void)somaAdViewDidClick:(SOMAVideoAdController *)adview;
- (void)somaVideoAd:(SOMAVideoAdController*) adview isClosed:(BOOL)userClickedCloseButton;
- (void)somaVideoAdWillLoadAd:(SOMAVideoAdController *)adview;
- (void)somaVideoAdWillEnterFullscreen:(SOMAVideoAdController *)adview;
- (void)somaVideoAdDidEnterFullscreen:(SOMAVideoAdController *)adview;
- (void)somaVideoAdApplicationWillGoBackground:(SOMAVideoAdController *)adview;
- (void)somaVideoAdWillExitFullscreen:(SOMAVideoAdController *)adview;
- (void)somaVideoAdDidExitFullscreen:(SOMAVideoAdController *)adview;
- (void)somaVideoAd:(SOMAVideoAdController *)adview didReceiveVideoAdEvent:(SOMAVideoAdTrackingEvent)event;
- (void)somaVideoAd:(SOMAVideoAdController *)adview didReceiveVideoAdEvent:(SOMAVideoAdTrackingEvent)event withURLCount:(NSUInteger)count;

- (void)somaVideoAdWillHide:(SOMAVideoAdController*)adview DEPRECATED_ATTRIBUTE;
- (void)somaVideoAdWillLeaveApplicationFromAd:(SOMAVideoAdController*)adview;
@end

@interface SOMAVideoAdController : UIViewController
@property NSURL* vastURL;
@property SOMAAdSettings* adSettings;
@property(readonly, getter=isReady) BOOL ready;
@property SOMAVideoAd* currentAd;
@property(nonatomic, weak) id<SOMAVideoAdControllerDelegate> delegate;
- (void)loadRewardedVideo;
- (void)load;
- (void)show;
- (void)show:(UIViewController*)rootViewController;
@end
