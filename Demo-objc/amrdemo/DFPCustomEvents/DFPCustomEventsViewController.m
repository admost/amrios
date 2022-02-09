//
//  AdmobCustomEventsViewController.m
//  AMRDemo
//
//  Created by Tolga Seremet on 08/05/17.
//  Copyright © 2017 Tolga Seremet. All rights reserved.
//

#import "DFPCustomEventsViewController.h"

@import GoogleMobileAds;

@interface DFPCustomEventsViewController () <
GADBannerViewDelegate,
GADFullScreenContentDelegate,
GAMBannerAdLoaderDelegate
> @end

@implementation DFPCustomEventsViewController {
    GADBannerView *_banner;
    GADInterstitialAd *_interstitial;
    GAMBannerView *_dFPBanner;
    GAMInterstitialAd *_dFPInterstitial;
    GADRewardedAd *_dfpRewardedAd;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - IBActions

- (IBAction)loadBanner {
    dispatch_async(dispatch_get_main_queue(), ^{
        GADAdSize customAdSize = GADAdSizeFromCGSize(CGSizeMake([UIScreen mainScreen].bounds.size.width, 50));
        self->_banner = [[GADBannerView alloc] initWithAdSize:customAdSize];
        self->_banner.adUnitID = @"ca-app-pub-3297656589511112/8773234182";
        self->_banner.delegate = self;
        self->_banner.rootViewController = self;
        
        GADRequest *request = [GADRequest request];
        
        /*
         If user consent is FALSE/NO then use following code.
         
         GADExtras *extras = [[GADExtras alloc] init];
         extras.additionalParameters = @{@"npa": @"1"};
         [request registerAdNetworkExtras:extras];
         */
        
        [self->_banner loadRequest:request];
    });
}

- (IBAction)loadInterstitial {
    dispatch_async(dispatch_get_main_queue(), ^{
        [GADInterstitialAd loadWithAdUnitID:@"ca-app-pub-3297656589511112/6995449788"
                                    request:[GADRequest request]
                          completionHandler:^(GADInterstitialAd * _Nullable interstitialAd, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Interstitial load error: %@", error.localizedDescription);
                return;
            }
            
            self->_interstitial = interstitialAd;
            self->_interstitial.fullScreenContentDelegate = self;
            [self->_interstitial presentFromRootViewController:self];
        }];
    });
}

- (IBAction)loadDFPBanner {
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_dFPBanner = [[GAMBannerView alloc] initWithAdSize:GADAdSizeBanner];
        self->_dFPBanner.adUnitID = @"/96769799/amr_ios_banner";
        self->_dFPBanner.delegate = self;
        self->_dFPBanner.rootViewController = self;
        
        GAMRequest *request = [GAMRequest request];
        
        /*
         If user consent is FALSE/NO then use following code.
         
         GADExtras *extras = [[GADExtras alloc] init];
         extras.additionalParameters = @{@"npa": @"1"};
         [request registerAdNetworkExtras:extras];
         */
        
        //parameters
//        NSMutableDictionary *params = [NSMutableDictionary new];
//        [params setObject:<YOUR_CUSTOM_NIB_NAME> forKey:@"customeNativeXibName"];
//
//        //extras
//        GADCustomEventExtras *extras = [GADCustomEventExtras new];
//        [extras setExtras:params forLabel:<YOUR_LABEL>];
//        [request registerAdNetworkExtras:extras];
        
        [self->_dFPBanner loadRequest:request];
    });
}

- (IBAction)loadDFPInterstitial {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        GAMRequest *request = [GAMRequest request];
        /*
        If user consent is FALSE/NO then use following code.
        
        GADExtras *extras = [[GADExtras alloc] init];
        extras.additionalParameters = @{@"npa": @"1"};
        [request registerAdNetworkExtras:extras];
        */
        
        [GAMInterstitialAd loadWithAdManagerAdUnitID:@"/96769799/amr_ios_interstitial"
                                                                    request:request
                                                          completionHandler:^(GAMInterstitialAd * _Nullable interstitialAd, NSError * _Nullable error) {
            if (error) {
                NSLog(@"DFP Interstitial load error: %@", error.localizedDescription);
                return;
            }
            
            self->_dFPInterstitial = interstitialAd;
            [self->_dFPInterstitial presentFromRootViewController:self];
        }];
    });
}

- (IBAction)loadDFPRewarded:(id)sender {
    GAMRequest *request = [GAMRequest request];
    GADMobileAds.sharedInstance.requestConfiguration.testDeviceIdentifiers = @[ @"53dcb902261497b734f6cbc5d23d6aea" ];
    
    [GADRewardedAd loadWithAdUnitID:@"/96769799/amr_ios_rewarded"
                            request:request
                  completionHandler:^(GADRewardedAd * _Nullable rewardedAd, NSError * _Nullable error) {
        if (error) {
            NSLog(@"DFP Rewarded load error: %@", error.localizedDescription);
            return;
        }
        
        self->_dfpRewardedAd = rewardedAd;
        self->_dfpRewardedAd.fullScreenContentDelegate = self;
        
        [self->_dfpRewardedAd presentFromRootViewController:self userDidEarnRewardHandler:^{
            NSLog(@"Rewarded user did earn reward.");
        }];
    }];
}

#pragma mark - <GAMBannerAdLoaderDelegate>

- (void)adLoader:(nonnull GADAdLoader *)adLoader didFailToReceiveAdWithError:(nonnull NSError *)error {
    NSLog(@"Error: %@", error.localizedDescription);
}

- (void)adLoader:(nonnull GADAdLoader *)adLoader didReceiveGAMBannerView:(nonnull GAMBannerView *)bannerView {
    bannerView.frame = CGRectMake(0, 100, bannerView.frame.size.width, bannerView.frame.size.height);
    [self.view addSubview:bannerView];
}

- (nonnull NSArray<NSValue *> *)validBannerSizesForAdLoader:(nonnull GADAdLoader *)adLoader {
    GADAdSize adSize = GADAdSizeFromCGSize(CGSizeMake([UIScreen mainScreen].bounds.size.width, 50));
    return @[@(adSize)];
}

#pragma mark - <GADFullScreenContentDelegate>

- (void)adDidRecordImpression:(id<GADFullScreenPresentingAd>)ad {}

- (void)ad:(id<GADFullScreenPresentingAd>)ad didFailToPresentFullScreenContentWithError:(NSError *)error {
    NSLog(@"Fullscreen ad fail to present.");
}

- (void)adDidPresentFullScreenContent:(id<GADFullScreenPresentingAd>)ad {
    NSLog(@"Fullscreen ad did present.");
}

- (void)adDidDismissFullScreenContent:(id<GADFullScreenPresentingAd>)ad {
    NSLog(@"Fullscreen ad dismissed.");
}

@end
