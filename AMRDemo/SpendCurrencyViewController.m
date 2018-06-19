//
//  CollectRewardsViewController.m
//  AMRDemo
//
//  Created by Tolga Seremet on 28/11/16.
//  Copyright © 2016 Tolga Seremet. All rights reserved.
//

#import "SpendCurrencyViewController.h"
#import <AMRSDK/AMRSDK.h>

@interface SpendCurrencyViewController () <AMRVirtualCurrencyDelegate> @end

@implementation SpendCurrencyViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    [AMRSDK setVirtualCurrencyDelegate:nil];
}

- (IBAction)spend {
    [AMRSDK setVirtualCurrencyDelegate:self];
    [AMRSDK spendVirtualCurrency];
}

#pragma mark - <AMRVirtualCurrencyDelegate>

- (void)didSpendVirtualCurrency:(NSString *)currency
                          amout:(NSNumber *)amount
                        network:(AMRNetworkType)network {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Virtual Currency Spent"
                                                                   message:[NSString stringWithFormat:@"%@ %@", amount, currency]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
