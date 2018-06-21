//
//  SOMAAdRenderer.h
//  iSoma
//
//  Created by Aman Shaikh on 11/12/14.
//  Copyright (c) 2014 Smaato Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SOMAAd.h"
#import "SOMAWKWebView.h"

@class SOMAAdRenderer;
@class SOMAMRAIDAdapter;

@protocol SOMARenderedAdViewDelegate <NSObject>
- (BOOL)isInterstitialAdView;
- (void)renderedAdViewDidFinishedRendering:(UIView*)renderedView;
@end


@protocol SOMAAdRendererWebViewDelegate <NSObject>
- (void)adRenderer:(SOMAAdRenderer*)renderer willLoadURL:(NSURL*)url;
- (void)adRenderer:(SOMAAdRenderer*)renderer didLoad:(NSError*)error withTitle:(NSString*)title;
@end

@protocol SOMAAdRendererUserEventDelegate <NSObject>
- (void)adRenderer:(SOMAAdRenderer*)renderer didTap:(BOOL)isMRAID;
- (void)adRenderer:(SOMAAdRenderer*)renderer appOpenURL:(NSURL*)url;
- (void)adRenderer:(SOMAAdRenderer*)renderer mraidOpenURL:(NSURL*)url;
- (void)adRenderer:(SOMAAdRenderer*)renderer mraidExpand:(BOOL)showCloseButton;
- (void)adRendererLoadHTTP:(SOMAAdRenderer*)renderer;

// It is always for mraid
- (void)adRenderer:(SOMAAdRenderer*)renderer close:(BOOL)isMraid;
@end

typedef void(^VASTImpressionCallback)(NSString *trackingEventName);
typedef void(^VASTBeaconsTracking)(NSArray *beacons);
typedef void(^MRAIDParametersTracking)(NSDictionary *parameters);

typedef NS_ENUM(NSInteger, SOMAVideoAdTrackingEvent){
    SOMAVideoAdTrackingEventStart = 0,
    SOMAVideoAdTrackingEventFirstQuartile,
    SOMAVideoAdTrackingEventMidpoint,
    SOMAVideoAdTrackingEventThirdQuartile,
    SOMAVideoAdTrackingEventComplete,
	SOMAVideoAdTrackingEventFullscreen,
	SOMAVideoAdTrackingEventMute,
	SOMAVideoAdTrackingEventPause,
	SOMAVideoAdTrackingEventClick,
	SOMAVideoAdTrackingEventImpression,
	SOMAVideoAdTrackingEventCompanionImpression,
};

@class SOMAAdView;

@interface SOMAAdRenderer : UIView
@property BOOL isTapped;
@property SOMAWKWebView* webView;
@property (nonatomic, assign) BOOL scalesPageToFit;
@property (weak) UIViewController* viewController;
@property SOMAMRAIDAdapter* mraidAdapter;


@property (getter=isOneTimeClickable, nonatomic) BOOL oneTimeClickable;
@property (nonatomic) SOMAAd* ad;
@property NSMutableArray* urlTraces;// used to trace auto redirect URLs, IOS-753
@property (weak) SOMAAdView* adView;


@property BOOL isMRAID;
@property BOOL expanded;
@property (nonatomic, weak) id<SOMARenderedAdViewDelegate> delegate;
@property (nonatomic, weak) id<SOMAAdRendererUserEventDelegate> eventDelegate;
@property (nonatomic, weak) id<SOMAAdRendererWebViewDelegate> webDelegate;

@property (nonatomic, copy) VASTImpressionCallback impressionCallback;
@property (nonatomic, copy) VASTBeaconsTracking callback;
@property (nonatomic, copy) MRAIDParametersTracking parametersMRAID;

- (void) fireMRAIDSizeChanged:(CGRect)frame;
- (void) fireMraidClose;
- (void) handleAppLink;
- (void) render:(SOMAAd*)ad;
- (void) didShow;
- (void) didHide;
- (void) onTapped:(UIGestureRecognizer*)gesture;
- (void) performAutoRedirect:(NSURL*)redirectURL;
@end
