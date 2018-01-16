//
//  LoopMeInterstitial.h
//  LoopMeSDK
//
//  Copyright (c) 2012 LoopMe. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * AppKeys for test purposes
 */

static NSString * const TEST_APP_KEY_INTERSTITIAL_PORTRAIT = @"test_interstitial_p";
static NSString * const TEST_APP_KEY_INTERSTITIAL_LANDSCAPE = @"test_interstitial_l";

@class LoopMeInterstitialGeneral;
@class LoopMeTargeting;
@class UIViewController;
@protocol LoopMeInterstitialDelegate;

/**
 * The `LoopMenterstitial` class provides the facilities to display a full-screen ad
 * during natural transition points in your application.
 *
 * It is recommented to define interstitial's `targeting` property, which will be passed as part of the ad request to get more relevant advertisement.
 * Also for the same purpose, the SDK tries to get the user location and keeps informed about location updating simply using timer with 10 minutes interval.
 * You can use `LoopMeGeoLocationProvider` `locationUpdatesEnabled` property to opt out of this functionality.
 * The SDK will never prompt the user for permission if location permissions are not currently granted.
 *
 * It is recommended to implement `LoopMeInterstitialDelegate`
 * to stay informed about ad state changes,
 * such as when an ad has been loaded or has failed to load its content, when video ad has been watched completely,
 * when an ad has been presented or dismissed from the screen, and when an ad has expired or received a tap.
 */
@interface LoopMeInterstitial : NSObject

@property (nonatomic, weak) id<LoopMeInterstitialDelegate> delegate;

/**
 * The appKey uniquely identifies your app to the LoopMe ad network.
 * To get an appKey visit the LoopMe Dashboard.
 */
@property (nonatomic, strong, readonly) NSString *appKey;

/**
 * Indicates whether the interstitial is loading an ad content.
 * It is set to yes after calling `loadAd` method. It is set to NO when ad succeds or fails to load.
 * While this property is YES all other calling `loadAd` methods will be ignored
 */
@property (nonatomic, assign, readonly, getter = isLoading) BOOL loading;

/**
 * Set YES if you want to enable automatic loading mode with high display rate performance. Default value YES.
 */
@property (nonatomic, assign, getter = isAutoLoadingEnabled) BOOL autoLoadingEnabled;

/**
 * Set YES if you want to disable loading video when Wi-Fi turned off. Default value NO.
 */
@property (nonatomic, assign, getter = isDoNotLoadVideoWithoutWiFi) BOOL doNotLoadVideoWithoutWiFi;


/**
 * Indicates whether ad content was loaded succesfully and ready to be displayed.
 * After you initialized a `LoopMeInterstitial` object and triggered the `loadAd` method,
 * this property will be set to YES on it's successful completion.
 * It is set to NO when loaded ad content has expired or already was presented,
 * in this case it requires next `loadAd` method triggering
 */
@property (nonatomic, assign, readonly, getter = isReady) BOOL ready;

/**
 * Returns new `LoopMeInterstitial` object with the given appKey
 * OR existing one from shared pool if it was previously created for given appKey (see `sharedInterstitials` method).
 * It guarantees that only one `LoopMeInterstitial` object per appKey can be initialized.
 * Use `removeSharedInterstitial` method to remove it completely from shared pool.
 * @param appKey - unique identifier in LoopMe ad network.
 * @param delegate - delegate
 */
+ (instancetype)interstitialWithAppKey:(NSString *)appKey
                                             delegate:(id<LoopMeInterstitialDelegate>)delegate;

- (instancetype)initWithAppKey:(NSString *)appKey
                          delegate:(id<LoopMeInterstitialDelegate>)delegate;


/**
 * Starts loading ad content process.
 * It is recommended triggering it in advance to have interstitial ad ready and to be able to display instantly in your application.
 * After its execution, the `LoopMeInterstitial` notifies its delegate whether the loading of the ad content failed or succeded.
 */
- (void)loadAd;

/**
 * See `loadAd` method
 * @param targeting - represents `LoopMeTargeting` class to be used to get more relevant advertisement
 */
- (void)loadAdWithTargeting:(LoopMeTargeting *)targeting;

/**
 * See `loadAd` method.
 * Not for use by the publisher.
 */
- (void)loadAdWithTargeting:(LoopMeTargeting *)targeting integrationType:(NSString *)integrationType;

/**
 * Presents an interstitial ad modally.
 * This method presents interstitial ad if `ready` property is set to YES, otherwise this method does nothing
 * @param viewController view controller from which interstitial ad will be presented.
 * @param animated - animate presenting
 */
- (void)showFromViewController:(UIViewController *)viewController
                      animated:(BOOL)animated;
/**
 * Dismisses an interstitial ad.
 * This method dismisses an interstitial ad and only if it is currently presented.
 * @param animated - animate dismissing
 */
- (void)dismissAnimated:(BOOL)animated;

@end

@protocol LoopMeInterstitialDelegate <NSObject>
@optional

/**
 * Triggered when the interstitial has successfully loaded the ad content
 * @param interstitial - object the sender of message
 */
- (void)loopMeInterstitialDidLoadAd:(LoopMeInterstitial *)interstitial;

/**
 * Triggered when interstitial ad failed to load ad content
 * @param  interstitial object - the sender of message
 * @param error - error of unsuccesful ad loading attempt
 */
- (void)loopMeInterstitial:(LoopMeInterstitial *)interstitial
  didFailToLoadAdWithError:(NSError *)error;

/**
 * Triggered only when interstitial's video was played until the end.
 * It won't be sent if the video was skipped or the interstitial was dissmissed during the displaying process
 * @param interstitial - object the sender of message
 */
- (void)loopMeInterstitialVideoDidReachEnd:(LoopMeInterstitial *)interstitial;

/**
 * Triggered when the interstitial's loaded ad content is expired.
 * Expiration happens when loaded ad content wasn't displayed during some period of time, approximately one hour.
 * Once the interstitial is presented on the screen, the expiration is no longer tracked and delegate won't receive this message
 * @param interstitial - object the sender of message
 */
- (void)loopMeInterstitialDidExpire:(LoopMeInterstitial *)interstitial;

/**
 * Triggered when the interstitial ad will appear on the screen
 * @param interstitial - object the sender of message
 */
- (void)loopMeInterstitialWillAppear:(LoopMeInterstitial *)interstitial;

/**
 * Triggered when the interstitial ad did appear on the screen
 * @param interstitial - object the sender of message
 */
- (void)loopMeInterstitialDidAppear:(LoopMeInterstitial *)interstitial;

/**
 * Triggered when the interstitial ad will disappear from the screen
 * @param interstitial - object the sender of message
 */
- (void)loopMeInterstitialWillDisappear:(LoopMeInterstitial *)interstitial;

/**
 * Triggered when the interstitial ad will disappear from the screen
 * Interstitial's `ready` property is set to NO
 * @param interstitial - object the sender of message
 */
- (void)loopMeInterstitialDidDisappear:(LoopMeInterstitial *)interstitial;

/**
 * Triggered when the user taps the interstitial ad and the interstitial is about to perform extra actions
 * Those actions may lead to displaying a modal browser or storeKit view controller or leaving your application.
 * @param interstitial - object the sender of message
 */
- (void)loopMeInterstitialDidReceiveTap:(LoopMeInterstitial *)interstitial;

/**
 * Triggered when your application is about to go to the background, initiated by the SDK.
 * This may happen in various ways, f.e if user wants open the SDK's browser web page in native browser or clicks on `mailto:` links...
 * @param interstitial - object the sender of message
 */
- (void)loopMeInterstitialWillLeaveApplication:(LoopMeInterstitial *)interstitial;

@end
