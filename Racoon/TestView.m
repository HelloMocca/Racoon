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
    [donut setTitle:@"donut"];
    [donut setRatio:0.55f];
    [donut setFrame:CGRectMake(0, 0, 200, 200)];
    [self addSubview:donut];
    
    RCLineChart *line = [[RCLineChart alloc] initWithFrame:CGRectMake(0, 200, [[UIScreen mainScreen]bounds].size.width, 200)];
    [line setTitle:@"Line Chart"];
    [self addSubview:line];
    [line setTitle:@"Maltie Chart"];
    
    RCStackBar *bar = [[RCStackBar alloc] initWithFrame:CGRectMake(0,400, [[UIScreen mainScreen]bounds].size.width, 40)];
    
    NSArray *values = [NSArray arrayWithObjects:@(0.20f),@(0.25f),@(0.35f),@(0.15f),@(0.05f),nil];
    [bar setData:values];
    [self addSubview:bar];
}

@end
