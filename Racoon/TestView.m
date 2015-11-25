//
//  TestView.m
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    RCDoughnut *donut = [[RCDoughnut alloc] init];
    [donut setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
    [donut setTitle:@"donut"];
    [donut setData:0.55f];
    [self addSubview:donut];
    
    RCPolar *polar = [[RCPolar alloc] init];
    [polar setFrame:CGRectMake(0, CGRectGetMaxY(donut.frame)+10, [UIScreen mainScreen].bounds.size.width, 150)];
    NSArray *polarData = [NSArray arrayWithObjects:@(100),@(80),@(70),@(90),@(60),@(75),@(85),@(65),nil];
    [polar setData:polarData];
    [self addSubview:polar];
    
    RCLineChart *line = [[RCLineChart alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(polar.frame)+10, [[UIScreen mainScreen]bounds].size.width, 200)];
    NSArray *lineData = [NSArray arrayWithObjects:@(100),@(80),@(70),@(90),@(60),@(75),@(85),@(65),nil];
    [line setData:lineData];
    [self addSubview:line];
    
    RCStackBar *stackBar = [[RCStackBar alloc] initWithFrame:CGRectMake(5,CGRectGetMaxY(line.frame)+10, [[UIScreen mainScreen]bounds].size.width-10, 20)];
    NSArray *stackBarData = [NSArray arrayWithObjects:@(0.20f),@(0.25f),@(0.35f),@(0.15f),@(0.05f),nil];
    [stackBar setData:stackBarData];
    [self addSubview:stackBar];
    
    RCSingleBar *bar = [[RCSingleBar alloc] init];
    [bar setFrame:CGRectMake(5, CGRectGetMaxY(stackBar.frame)+10, [[UIScreen mainScreen] bounds].size.width - 10, 15)];
    [bar setData:0.65f];
    [self addSubview:bar];
    
    [self setContentSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width, CGRectGetMaxY(bar.frame) + 150)];
}

@end
