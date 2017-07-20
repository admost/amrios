//
//  TappxInterstitialViewController.h
//  TappxFramework
//
//  Created by Ruben on 3/1/2017.
//  Copyright © 2017 Tappx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TappxInterstitialViewDelegate.h"
#import "TappxInterstitialViewControllerDelegate.h"

@class TappxSettings;

@interface TappxInterstitialViewController: UIViewController <TappxInterstitialViewControllerDelegate>
@property (nonatomic, assign) bool isReady;
@property (weak, nonatomic) id<TappxInterstitialViewControllerDelegate> delegate;
    
- (void)tappxInterstitialViewDidClose:(TappxInterstitialCustomView *)interstitialView;
- (void)tappxInterstitialViewDidPress:(TappxInterstitialCustomView *)interstitialView;

- (instancetype)initWithDelegate:(id<TappxInterstitialViewControllerDelegate>)delegate;
-(void)setAutoShowWhenReady:(BOOL)autoShow;
- (void)load:(TappxSettings*)settings;
- (void)load;
- (bool)isReady;
- (void)show;
@end
