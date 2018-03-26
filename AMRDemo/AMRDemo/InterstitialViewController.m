//
//  InterstitialViewController.m
//  AMRDemo
//
//  Created by Tolga Seremet on 25/08/16.
//  Copyright © 2016 Tolga Seremet. All rights reserved.
//

#import "InterstitialViewController.h"
#import <KKLog/KKLog.h>
#import <AMRSDK/AMRSDK.h>

@interface InterstitialViewController () <AMRInterstitialDelegate> {
    AMRInterstitial *_interstitial;
    IBOutlet UIActivityIndicatorView *AILoading;
}

@end

#pragma mark - View lifecycle

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _interstitial = [AMRInterstitial interstitialForZoneId:@"8dc73abb-fc83-4354-b7b5-20bdcbd98984"];

    _interstitial.delegate = self;
    [_interstitial loadInterstitial];
}

#pragma mark - <AMRInterstitialDelegate>

- (void)didReceiveInterstitial:(AMRInterstitial *)interstitial {
    [AILoading stopAnimating];
    [interstitial showFromViewController:self.navigationController];
}

- (void)didFailToReceiveInterstitial:(AMRInterstitial *)interstitial error:(AMRError *)error {
    [AILoading stopAnimating];
    KKLogError(error.errorDescription);
}

- (void)didShowInterstitial:(AMRInterstitial *)interstitial {
    KKLogInfo(@"Interstitial shown");
}

- (void)didDismissInterstitial:(AMRInterstitial *)interstitial {
    KKLogInfo(@"Interstitial dismissed");
}

@end
