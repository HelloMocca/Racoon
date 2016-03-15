//
//  BarChartTestView.m
//  Racoon
//
//  Created by Naver on 2016. 3. 15..
//  Copyright © 2016년 mocca. All rights reserved.
//

#import "BarChartTestView.h"
#import "Racoon.h"

@implementation BarChartTestView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    RCSingleBar *bar = [[RCSingleBar alloc] init];
    [bar setFrame:CGRectMake(5, 0, [[UIScreen mainScreen] bounds].size.width - 10, 15)];
    [bar setData:0.65f];
    [self addSubview:bar];
    
    [self setContentSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width, CGRectGetMaxY(bar.frame) + 150)];
}


@end
