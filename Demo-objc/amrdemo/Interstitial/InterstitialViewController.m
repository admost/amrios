//
//  InterstitialViewController.m
//  AMRDemo
//
//  Created by Tolga Seremet on 25/08/16.
//  Copyright © 2016 Tolga Seremet. All rights reserved.
//

#import "InterstitialViewController.h"
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

    _interstitial = [AMRInterstitial interstitialForZoneId:@"39f74377-5682-436a-9338-9d1c4df410bd"];

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
    NSLog(@"%@", error.errorDescription);
}

- (void)didShowInterstitial:(AMRInterstitial *)interstitial {
    NSLog(@"Interstitial shown");
}

- (void)didFailToShowInterstitial:(AMRInterstitial *)interstitial error:(AMRError *)error {
    NSLog(@"Interstitial fail to shown!: %@", error.errorDescription);
}

- (void)didClickInterstitial:(AMRInterstitial *)interstitial {
    NSLog(@"Interstitial clicked.");
}

- (void)didDismissInterstitial:(AMRInterstitial *)interstitial {
    NSLog(@"Interstitial dismissed");
}

@end
