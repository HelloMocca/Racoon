//
//  RCDoughnut.h
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCData.h"

@interface RCGauge : UIView

@property (nonatomic, readwrite) UILabel *titleLabel;
@property (nonatomic, readwrite) CGFloat gaugeWidth;

- (void)setData:(float)ratioValue;

- (void)setTitle:(NSString *)title;

- (void)setTitleColor:(UIColor *)color;

- (void)setGaugeColor:(UIColor *)color;

- (void)setTiming:(NSString *)timing;

- (void)setTitleFont:(UIFont *)font;

@end