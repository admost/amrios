//
//  RewardedVideoViewController.m
//  AMRDemo
//
//  Created by Tolga Seremet on 31/08/16.
//  Copyright © 2016 Tolga Seremet. All rights reserved.
//

#import "RewardedVideoViewController.h"
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

    _rewardedVideo = [AMRRewardedVideo rewardedVideoForZoneId:@"2bdefd44-5269-4cbc-b93a-373b74a2f067"];
    _rewardedVideo.delegate = self;
    [_rewardedVideo loadRewardedVideo];
}

#pragma mark - <AMRRewardedVideoDelegate>

- (void)didReceiveRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    [AILoading stopAnimating];
    [rewardedVideo showFromViewController:self.navigationController];
}

- (void)didFailToReceiveRewardedVideo:(AMRRewardedVideo *)rewardedVideo error:(AMRError *)error {
    [AILoading stopAnimating];
    NSLog(@"%@", error.errorDescription);
}

- (void)didShowRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    NSLog(@"Rewarded video shown.");
}

- (void)didFailToShowRewardedVideo:(AMRRewardedVideo *)rewardedVideo error:(AMRError *)error {
    NSLog(@"Rewarded video fail to shown!: %@", error.errorDescription);
}

- (void)didClickRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    NSLog(@"Rewarded video clicked.");
}

- (void)didDismissRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    NSLog(@"Rewarded video dismissed.");
}

- (void)didCompleteRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    NSLog(@"Rewarded video completed.");
}

@end
