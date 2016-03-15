//
//  GaugeChartTestView.m
//  Racoon
//
//  Created by Naver on 2016. 3. 15..
//  Copyright © 2016년 mocca. All rights reserved.
//

#import "GaugeChartTestView.h"

@implementation GaugeChartTestView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    RCGauge *defaultGauge = [[RCGauge alloc] init];
    [defaultGauge setFrame:CGRectMake(5, 0, [[UIScreen mainScreen] bounds].size.width - 10, 150)];
    [defaultGauge setData:0.65f];
    [defaultGauge setTitle:@"Default Gauge"];
    [self addSubview:defaultGauge];
    
    RCGauge *boldGauge = [[RCGauge alloc] init];
    [boldGauge setFrame:CGRectMake(5, CGRectGetMaxY(defaultGauge.frame)+10, [[UIScreen mainScreen] bounds].size.width - 10, 150)];
    [boldGauge setData:0.33f];
    [boldGauge setGaugeWidth:15];
    [boldGauge setTitle:@"Bold Gauge"];
    [self addSubview:boldGauge];
    
    RCGauge *colorGauge1 = [[RCGauge alloc] init];
    RCGauge *colorGauge2 = [[RCGauge alloc] init];
    RCGauge *colorGauge3 = [[RCGauge alloc] init];
    RCGauge *colorGauge4 = [[RCGauge alloc] init];
    RCGauge *colorGauge5 = [[RCGauge alloc] init];
    
    [colorGauge1 setFrame:CGRectMake(5, CGRectGetMaxY(boldGauge.frame)+10, 75, 75)];
    [colorGauge2 setFrame:CGRectMake(CGRectGetMaxX(colorGauge1.frame)+5, CGRectGetMaxY(boldGauge.frame)+10, 75, 75)];
    [colorGauge3 setFrame:CGRectMake(CGRectGetMaxX(colorGauge2.frame)+5, CGRectGetMaxY(boldGauge.frame)+10, 75, 75)];
    [colorGauge4 setFrame:CGRectMake(CGRectGetMaxX(colorGauge3.frame)+5, CGRectGetMaxY(boldGauge.frame)+10, 75, 75)];
    [colorGauge5 setFrame:CGRectMake(CGRectGetMaxX(colorGauge4.frame)+5, CGRectGetMaxY(boldGauge.frame)+10, 75, 75)];
    
    [colorGauge1 setData:0.23f];
    [colorGauge2 setData:0.45f];
    [colorGauge3 setData:0.67f];
    [colorGauge4 setData:0.78f];
    [colorGauge5 setData:0.91f];
    
    [colorGauge1 setGaugeColor:[UIColor colorWithRed:0.063f green:0.227f blue:0.341f alpha:1.00f]];
    [colorGauge2 setGaugeColor:[UIColor colorWithRed:0.098f green:0.376f blue:0.678f alpha:1.00f]];
    [colorGauge3 setGaugeColor:[UIColor colorWithRed:0.141f green:0.592f blue:0.847f alpha:1.00f]];
    [colorGauge4 setGaugeColor:[UIColor colorWithRed:0.224f green:0.780f blue:0.933f alpha:1.00f]];
    [colorGauge5 setGaugeColor:[UIColor colorWithRed:0.341f green:0.898f blue:0.996f alpha:1.00f]];
    
    [self addSubview:colorGauge1];
    [self addSubview:colorGauge2];
    [self addSubview:colorGauge3];
    [self addSubview:colorGauge4];
    [self addSubview:colorGauge5];
    
    [self setContentSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width, CGRectGetMaxY(colorGauge5.frame) + 150)];
}


@end
