//
//  SOMAAdProviderDelegate.h
//  iSoma
//
//  Created by Aman Shaikh on 23/06/14.
//  Copyright (c) 2014 Smaato Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SOMAAdProvider;
@class SOMAAd;

@protocol SOMAAdProviderDelegate <NSObject>
@required
-(void)adProvider:(SOMAAdProvider*)provider didProvidedAd:(SOMAAd*)ad;
-(void)adProvider:(SOMAAdProvider*)provider didProvidedMediationResponse:(NSArray*)mediatedNetworks;
-(void)adProvider:(SOMAAdProvider*)provider didFailed:(NSError*)error;
@end
