//
//  CustomNativeBannerViewController.m
//  AMRDemo
//
//  Created by Tolga Seremet on 31/10/17.
//  Copyright © 2017 Tolga Seremet. All rights reserved.
//

#import "CustomNativeBannerViewController.h"
#import <AMRSDK/AMRSDK.h>

@interface CustomNativeBannerViewController () <AMRBannerDelegate> {

    AMRBanner* _bannerCustom150x250;
    AMRBanner* _bannerCustom200x200;
    AMRBanner* _bannerCustom300x120;
    IBOutlet UIView *VBannerContainer150x250;
    IBOutlet UIView *VBannerContainer200x200;
    IBOutlet UIView *VBannerContainer300x120;
}

@end

@implementation CustomNativeBannerViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBanners];
}

#pragma mark - Load banners

- (void)loadBanners {

    /*
     AMR NATIVE ONLY TEST ZONE
     c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4
     */

    _bannerCustom150x250 = [AMRBanner bannerForZoneId:@"c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4"];
    _bannerCustom150x250.delegate = self;
    _bannerCustom150x250.customNativeSize = CGSizeMake(150, 250);
    _bannerCustom150x250.customeNativeXibName = @"CustomNative150x250";
    [_bannerCustom150x250 loadBanner];

    _bannerCustom200x200 = [AMRBanner bannerForZoneId:@"c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4"];
    _bannerCustom200x200.delegate = self;
    _bannerCustom200x200.customNativeSize = CGSizeMake(200, 200);
    _bannerCustom200x200.customeNativeXibName = @"CustomNative200x200";
    [_bannerCustom200x200 loadBanner];

    _bannerCustom300x120 = [AMRBanner bannerForZoneId:@"c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4"];
    _bannerCustom300x120.delegate = self;
    _bannerCustom300x120.customNativeSize = CGSizeMake(300, 120);
    _bannerCustom300x120.customeNativeXibName = @"CustomNative300x120";
    [_bannerCustom300x120 loadBanner];
}

#pragma mark - IBActions

- (IBAction)reloadBanners {
    [_bannerCustom150x250 loadBanner];
    [_bannerCustom200x200 loadBanner];
    [_bannerCustom300x120 loadBanner];
}

#pragma mark - <AMRBannerDelegate>

- (void)didReceiveBanner:(AMRBanner *)banner {
    if (banner == _bannerCustom150x250) {
        [VBannerContainer150x250 addSubview:banner.bannerView];
    } else if (banner == _bannerCustom200x200) {
        [VBannerContainer200x200 addSubview:banner.bannerView];
    } else if (banner == _bannerCustom300x120) {
        [VBannerContainer300x120 addSubview:banner.bannerView];
    }
}

- (void)didFailToReceiveBanner:(AMRBanner *)banner error:(AMRError *)error {
    NSLog(@"%@", error.errorDescription);
}

- (void)didClickBanner:(AMRBanner *)banner {}

@end
