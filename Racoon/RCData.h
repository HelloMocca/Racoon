//
//  RCData.h
//  Racoon
//
//  Created by mocca on 2015. 11. 20..
//  Copyright © 2015년 mocca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCData : NSObject

@property (nonatomic, readwrite) CGFloat value;
@property (nonatomic, readonly)  CGFloat currValue;
@property (nonatomic, getter=isUpdateEnd)  BOOL    updateEnd;

- (instancetype)initWithValue:(CGFloat)value;

- (void)setValue:(CGFloat)value;

- (void)updateValue;

@end
