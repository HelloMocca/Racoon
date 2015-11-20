//
//  RCData.m
//  Racoon
//
//  Created by mocca on 2015. 11. 20..
//  Copyright © 2015년 mocca. All rights reserved.
//

#import "RCData.h"

@implementation RCData

{
    CGFloat value;
    CGFloat currValue;
    BOOL    updateEnd;
}

@synthesize value = value;
@synthesize currValue = currValue;
@synthesize updateEnd = updateEnd;


- (instancetype)initWithValue:(CGFloat)aValue {
    self = [super init];
    if (self) {
        [self setValue:aValue];
    }
    return self;
}

- (void)setValue:(CGFloat)aValue {
    value = aValue;
    currValue = 0;
    updateEnd = NO;
}

- (void)updateValue {
    if (updateEnd) return;
    
    CGFloat distance = (value - currValue) * 0.02f;
    currValue += distance;
    if (distance < 0.0001f) {
        currValue = value;
    }
    [self updateEndCheck];
}

- (void)updateEndCheck {
    if (currValue == value) {
        updateEnd = YES;
    }
}

@end
