//
//  Nativevideo.h
//  LoopMeSDK
//
//  Created by Kogda Bogdan on 2/13/15.
//
//

#import <UIKit/UIKit.h>

/**
 * AppKey for test purposes
 */

static NSString * const TEST_APP_KEY_MPU = @"test_mpu";

@class LoopMeTargeting;

@protocol LoopMeAdViewDelegate;

/**
 * The `LoopMeAdView` class provides facilities to display a custom size ads
 * during natural transition points in your application.
 *
 * It is recommented to define adView's `targeting` property, which will be passed as part of the ad request to get more relevant advertisement.
 * Also for the same purpose, the SDK tries to get the user location and keeps informed about location updating simply using timer with 10 minutes interval.
 * You can use `LoopMeGeoLocationProvider` `locationUpdatesEnabled` property to opt out of this functionality.
 * The SDK will never prompt the user for permission if location permissions are not currently granted.
 *
 * It is recommended to implement `LoopMeAdViewDelegate`
 * to stay informed about ad state changes,
 * such as when an ad has been loaded or has failed to load its content, when video ad has been watched completely,
 * when an ad has been presented or dismissed from the screen, and when an ad has expired or received a tap.
 */
@interface LoopMeAdView : UIView

@property (nonatomic, weak) id<LoopMeAdViewDelegate> delegate;

/*
 * Enabling minimized mode.
 * Represents copy of original ad added on top of `UIWindow`'s right-bottom corner.
 * Minimized ad appears/disappears on the screen during scrolling when visibility of original ad is changed
*/
@property (nonatomic, assign, getter = isMinimizedModeEnabled) BOOL minimizedModeEnabled;

/**
 * The appKey uniquely identifies your app to the LoopMe ad network.
 * To get an appKey visit the LoopMe Dashboard.
 */
@property (nonatomic, strong, readonly) NSString *appKey;

/**
 * Indicates whether the adView is loading an ad content.
 * It is set to yes after calling `loadAd` method. It is set to NO when ad succeds or fails to load.
 * While this property is YES all other calling `loadAd` methods will be ignored
 */
@property (nonatomic, assign, readonly, getter = isLoading) BOOL loading;

@property (nonatomic, weak) UIScrollView *scrollView;

/**
 * Set YES if you want to disable loading video when Wi-Fi turned off. Default value NO.
 */
@property (nonatomic, assign, getter = isDoNotLoadVideoWithoutWiFi) BOOL doNotLoadVideoWithoutWiFi;

/**
 * Indicates whether ad content was loaded succesfully and ready to be displayed.
 * After you initialized a `LoopMeAdView` object and triggered the `loadAd` method,
 * this property will be set to YES on it's successful completion.
 * It is set to NO when loaded ad content has expired or already was presented,
 * in this case it requires next `loadAd` method triggering
 */
@property (nonatomic, assign, readonly, getter = isReady) BOOL ready;

/**
 * Returns new `LoopMeAdView` object with the given appKey
 * @param appKey - unique identifier in LoopMe ad network.
 * @param delegate - delegate
 */
+ (LoopMeAdView *)adViewWithAppKey:(NSString *)appKey
                             frame:(CGRect)frame
                          delegate:(id<LoopMeAdViewDelegate>)delegate;

/**
 * Returns new `LoopMeAdView` object with the given appKey.
 * Use this method if adView will be added to scrollable content.
 * @param appKey - unique identifier in LoopMe ad network.
 * @param scrollView scrollView to be used to calculate ad area visibility and manage ad activity
 * @param delegate - delegate
 */
+ (LoopMeAdView *)adViewWithAppKey:(NSString *)appKey
                             frame:(CGRect)frame
                        scrollView:(UIScrollView *)scrollView
                          delegate:(id<LoopMeAdViewDelegate>)delegate;
/**
 * Starts loading ad content process.
 * It is recommended triggering it in advance to have ad ready and to be able to display ad instantly in your application.
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
 * Manages the ad visibility inside the scrollable content aka UITableView/UICollectionView scrollViews
 * It automatically calculates the ad area visibility and pauses any activity currently happening inside the ad 
 * (whether it's a video or animations) if the ad is less than 50% visible, otherwise resumes
 */
- (void)updateAdVisibilityInScrollView;

/**
 * Manages the ad visibility area manually, as an alternative to `updateAdVisibilityInScrollView`
 * Sometimes there is a necessity to pause/resume the ad's activity 
 * during natural transitions between your views or view controllers.
 */
- (void)setAdVisible:(BOOL)visible;

@end

@protocol LoopMeAdViewDelegate <NSObject>

@required

/**
 * Shoud return `UIViewController` to be used as root view controller for presenting modally
 */
- (UIViewController *)viewControllerForPresentation;

@optional

/**
 * Triggered when the interstitial has successfully loaded the ad content
 * It is recommended not to add adView as subview untill you recieve this notification
 * or alternatively you may check `isReady` property.
 * @param adView - sender
 */
- (void)loopMeAdViewDidLoadAd:(LoopMeAdView *)adView;

/**
 * Triggered when adView failed to load ad.
 * If adView was already added as subview, you should remove it in implementation of this message
 * to avoid having empty view content
 * @param adView - sender
 * @param error - error of unsuccesful ad loading attempt
 */
- (void)loopMeAdView:(LoopMeAdView *)adView didFailToLoadAdWithError:(NSError *)error;

/**
 * Triggered only when adView's video was played until the end.
 * @param adView - sender
 */
- (void)loopMeAdViewVideoDidReachEnd:(LoopMeAdView *)adView;

/**
 * Triggered when the adView's loaded ad content is expired.
 * Expiration happens when loaded ad content wasn't displayed during some period of time, approximately one hour.
 * Once the adView is presented on the screen, the expiration is no longer tracked and delegate won't receive this message
 * @param adView - sender
 */
- (void)loopMeAdViewDidExpire:(LoopMeAdView *)adView;

/**
 * Triggered when the user taps the ad and it is about to perform extra actions
 * Those actions may lead to displaying a modal browser or storeKit view controller or leaving your application.
 * @param adView - sender
 */
- (void)loopMeAdViewDidReceiveTap:(LoopMeAdView *)adView;

/**
 * Triggered when your application is about to go to the background, initiated by the SDK.
 * This may happen in various ways, f.e if user wants open the SDK's browser web page in native browser or clicks on `mailto:` links...
 * @param adView - sender
 */
- (void)loopMeAdViewWillLeaveApplication:(LoopMeAdView *)adView;

/**
 * Triggered when the ad will move to superview
 * @param adView - object the sender of message
 */
- (void)loopMeAdViewWillAppear:(LoopMeAdView *)adView;

/**
 * Triggered when the ad will remove from superview
 * @param adView - object the sender of message
 */
- (void)loopMeAdViewWillDisappear:(LoopMeAdView *)adView;

@end
