//
//  OfferWallViewController.m
//  AMRDemo
//
//  Created by Tolga Seremet on 28/11/16.
//  Copyright © 2016 Tolga Seremet. All rights reserved.
//

#import "OfferWallViewController.h"
#import <AMRSDK/AMRSDK.h>

@interface OfferWallViewController () <AMROfferWallDelegate> {
    AMROfferWall *_offerWall;
    IBOutlet UIActivityIndicatorView *AILoading;
    BOOL _isShown;
}

@end

#pragma mark - View lifecycle

@implementation OfferWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if(!_isShown) {
        _isShown = YES;
        _offerWall = [AMROfferWall offerWallForZoneId:@"1cadca08-33f9-4da7-969e-ef116d4e7d0e"];
        _offerWall.delegate = self;
        [_offerWall loadOfferWall];
    }
}

#pragma mark - <AMROfferWallDelegate>

- (void)didReceiveOfferWall:(AMROfferWall *)offerwall {
    [AILoading stopAnimating];
    [offerwall showFromViewController:self.navigationController];
}

- (void)didFailToReceiveOfferWall:(AMROfferWall *)offerwall error:(AMRError *)error {
    [AILoading stopAnimating];
    NSLog(@"%@", error.errorDescription);
}

- (void)didShowOfferWall:(AMROfferWall *)offerwall {
    NSLog(@"OfferWall shown");
}

- (void)didFailToShowOfferWall:(AMROfferWall *)offerwall error:(AMRError *)error {
    NSLog(@"OfferWall fail to shown!: %@", error.errorDescription);
}

- (void)didDismissOfferWall:(AMROfferWall *)offerwall {
    NSLog(@"Offerwall dismissed");
}

@end
