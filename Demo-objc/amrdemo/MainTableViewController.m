//
//  MainTableViewController.m
//  amrdemoObjc
//
//  Created by Mehmet Karagöz on 21.06.2019.
//  Copyright © 2019 Kokteyl. All rights reserved.
//

#import "MainTableViewController.h"
#import <AMRSDK/AMRSDK.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (@available(iOS 14.5, *)) {
            [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
                NSLog(@"status: %@", @(status));
                [AMRSDK updateATTStatus];
            }];
        }
    });
}

@end
