//
//  RCPolar.m
//  Racoon
//
//  Created by mocca on 2015. 10. 30..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "RCPolar.h"

@implementation RCPolar
{
    CGPoint center;
    CGFloat radius;
    NSArray *colors;
    CGFloat maxValue;
    CGFloat animationValue;
    
    NSMutableArray *dataArray;
    
    BOOL animationEnd;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setColors:[NSArray arrayWithObjects:
                            [UIColor colorWithRed:0.098f green:0.376f blue:0.678f alpha:1.00f],
                            [UIColor colorWithRed:0.141f green:0.592f blue:0.847f alpha:1.00f],
                            [UIColor colorWithRed:0.224f green:0.780f blue:0.933f alpha:1.00f],
                            [UIColor colorWithRed:0.341f green:0.898f blue:0.996f alpha:1.00f],
                            nil]];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    center.x = frame.size.width/2;
    center.y = frame.size.height/2;
    radius = (frame.size.width > frame.size.height) ? frame.size.height/2.0f : frame.size.width/2.0f;
}

- (void)setData:(NSArray *)datas {
    dataArray = [[NSMutableArray alloc] init];
    
    maxValue = 0;
    animationValue = 0;
    CGFloat currValue;
    for (int i = 0, count = (int)[datas count]; i < count; i++) {
        currValue = [[datas objectAtIndex:i] floatValue];
        if (maxValue < currValue) maxValue = currValue;
        [dataArray addObject:[[RCData alloc] initWithValue:currValue]];
    }
}

- (void)setColors:(NSArray *)uiColorArray {
    colors = [NSArray arrayWithArray:uiColorArray];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSUInteger dataLength = [dataArray count];
    CGFloat startAngle = 0;
    CGFloat angleTerm = ((M_PI * 2) / dataLength);
    CGFloat currValue;
    for (int i = 0; i < dataLength; i++) {
        currValue = [[dataArray objectAtIndex:i] currValue];
        
        startAngle = (M_PI*2) * (i*1.0f / dataLength*1.0f);
        CGContextMoveToPoint(context, center.x, center.y);
        CGContextAddArc(context, center.x, center.y, radius * (currValue / maxValue), -(M_PI/2)+startAngle, -(M_PI/2)+startAngle+angleTerm, NO);
        CGContextSetFillColorWithColor(context, [[colors objectAtIndex:i%[colors count]] CGColor] );
        CGContextFillPath(context);
    }
    
    if (!animationEnd) {
    [NSTimer scheduledTimerWithTimeInterval:.025 target:self selector:@selector(updateData) userInfo:nil repeats:NO];
    }
}

- (void)updateData {
    animationEnd = YES;
    RCData *currData;
    for (int i = 0, count = (int)[dataArray count]; i < count; i++) {
        currData = [dataArray objectAtIndex:i];
        [currData updateValue];
        animationEnd = (animationEnd && [currData isUpdateEnd]);
    }
    [self setNeedsDisplay];
}


@end
