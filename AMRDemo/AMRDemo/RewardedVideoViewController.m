//
//  RewardedVideoViewController.m
//  AMRDemo
//
//  Created by Tolga Seremet on 31/08/16.
//  Copyright © 2016 Tolga Seremet. All rights reserved.
//

#import "RewardedVideoViewController.h"
#import <KKLog/KKLog.h>
#import <AMRSDK/AMRSDK.h>

@interface RewardedVideoViewController () <AMRRewardedVideoDelegate> {
    AMRRewardedVideo* _rewardedVideo;
    IBOutlet UIActivityIndicatorView *AILoading;
}

@end

#pragma mark - View lifecycle

@implementation RewardedVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _rewardedVideo = [AMRRewardedVideo rewardedVideoForZoneId:@"c111d8cc-6441-4bd8-825a-b6d13a2cd957"];
    _rewardedVideo.delegate = self;
    [_rewardedVideo loadRewardedVideo];
}

- (void)dealloc {
    
}

#pragma mark - <AMRRewardedVideoDelegate>

- (void)didReceiveRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    [AILoading stopAnimating];
    [rewardedVideo showFromViewController:self.navigationController];
}

- (void)didFailToReceiveRewardedVideo:(AMRRewardedVideo *)rewardedVideo error:(AMRError *)error {
    [AILoading stopAnimating];
    KKLogError(error.errorDescription);
}

- (void)didShowRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    KKLogInfo(@"Rewarded video shown");
}

- (void)didDismissRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    KKLogInfo(@"Rewarded video dismissed");
}

- (void)didCompleteRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    KKLogInfo(@"Rewarded video completed");
}

- (void)didRewardUser:(NSNumber *)rewardAmount forRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    KKLogInfo(@"User rewarded with amount: %@", rewardAmount);
}

@end