//
//  AppDelegate.m
//  amrdemo
//
//  Created by Mehmet Karagöz on 9.02.2022.
//

#import "AppDelegate.h"
#import <AMRSDK/AMRSDK.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [AMRSDK setLogLevel:AMRLogLevelSilent];

    // Set user consent before startWithAppId
    [AMRSDK setUserConsent:YES];
    [AMRSDK subjectToGDPR:NO];

    [AMRSDK startWithAppId:@"15066ddc-9c18-492c-8185-bea7e4c7f88c" completion:^(AMRError *error) {
        [AMRSDK startTesterInfoWithAppId:@"15066ddc-9c18-492c-8185-bea7e4c7f88c"];
    }];
    
    return YES;
}

@end
