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
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    RCDoughnut *donut = [[RCDoughnut alloc] init];
    [donut setFrame:CGRectMake(150, 0, 150, 150)];
    [donut setTitle:@"donut"];
    [donut setData:0.55f];
    [self addSubview:donut];
    
    RCPolar *polar = [[RCPolar alloc] init];
    [polar setFrame:CGRectMake(0, 0, 150, 150)];
    NSArray *polarData = [NSArray arrayWithObjects:@(100),@(80),@(70),@(90),@(60),@(75),@(85),@(65),nil];
    [polar setData:polarData];
    [self addSubview:polar];
    
    RCLineChart *line = [[RCLineChart alloc] initWithFrame:CGRectMake(0, 200, [[UIScreen mainScreen]bounds].size.width, 200)];
    [self addSubview:line];
    [line setTitle:@"RACOON Chart"];
    
    RCStackBar *bar = [[RCStackBar alloc] initWithFrame:CGRectMake(0,400, [[UIScreen mainScreen]bounds].size.width, 40)];
    NSArray *stackBarData = [NSArray arrayWithObjects:@(0.20f),@(0.25f),@(0.35f),@(0.15f),@(0.05f),nil];
    [bar setData:stackBarData];
    [self addSubview:bar];
}

@end
