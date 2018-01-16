//
//  LoopMeTargeting.h
//  LoopMeSDK
//
//  Created by Bohdan Korda on 10/14/14.
//  Copyright (c) 2014 LoopMe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LoopMeGender)
{
    LoopMeGenderUnknown,
    LoopMeGenderMale,
    LoopMeGenderFemale
};

/**
 * Represents extra information to be passed as part of ad request 
 * to get more relevant advertisement
 */
@interface LoopMeTargeting : NSObject

/**
 * A string representing a set of keywords
 * Keywords are typically used to target ad campaigns at specific user segments. 
 * They should be formatted as comma-separated key-value pairs (e.g. "genre: game, marital: single").
 */
@property (nonatomic, strong) NSString *keywords;

/**
 * Year of birth to be used to get more relevant advertisement for age group
 */
@property (nonatomic, strong) NSNumber *yearOfBirth;

/**
 * Gender
 */
@property (nonatomic, assign) LoopMeGender gender;

- (instancetype)initWithKeywords:(NSString *)keywords
                     yearOfBirth:(NSNumber *)yob
                          gender:(LoopMeGender) gender NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithKeywords:(NSString *)keywords;
- (instancetype)initWithGender:(LoopMeGender)gender;
- (instancetype)initWithYearOfBirth:(NSNumber *)yearOfBirth;

- (NSString *)yearOfBirthParameter;
- (NSString *)genderParameter;
- (NSString *)keywordsParameter;

@end
