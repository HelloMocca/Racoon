//
//  RCStackBar.m
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "RCStackBar.h"

@implementation RCStackBar

{
    BOOL animationStart;
    BOOL animationEnd;
    NSTimer *animationTimer;
    
    NSUInteger numOfBar;
    NSArray *values;
    NSMutableArray * barRects;
    NSArray * barColors;
}

#pragma mark -Initialize methods
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupWithDefaultSetting];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupWithDefaultSetting];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupWithDefaultSetting];
    }
    return self;
}

- (void)setupWithDefaultSetting {
    NSLog(@"setupDefault");
    [self setBackgroundColor:[UIColor colorWithRed:0.059f green:0.184f blue:0.216f alpha:1.00f]];
    [self setupDefaultColorSet];
}

- (void)setupDefaultColorSet {
    [self setBarColors:[NSArray arrayWithObjects:
                        [UIColor colorWithRed:0.063f green:0.227f blue:0.341f alpha:1.00f],
                        [UIColor colorWithRed:0.098f green:0.376f blue:0.678f alpha:1.00f],
                        [UIColor colorWithRed:0.141f green:0.592f blue:0.847f alpha:1.00f],
                        [UIColor colorWithRed:0.224f green:0.780f blue:0.933f alpha:1.00f],
                        [UIColor colorWithRed:0.341f green:0.898f blue:0.996f alpha:1.00f],
                        nil]];
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

- (void)setData:(NSArray *)dataArray {
    animationStart = NO;
    values = [NSArray arrayWithArray:dataArray];
    numOfBar = [values count];
    barRects = [[NSMutableArray alloc] init];
    for (int i = 0; i < numOfBar; i++) {
        [barRects addObject:[[RCBar alloc]
                             initWithCurrSize:
                                CGSizeMake((self.frame.size.width/numOfBar), self.frame.size.height)
                             DestSize:
                                CGSizeMake((self.frame.size.width * [[values objectAtIndex:i] floatValue]), self.frame.size.height)
                             Rect:CGRectMake(i * (self.frame.size.width/numOfBar), 0, self.frame.size.width/numOfBar, self.frame.size.height)
                             Color:[[barColors objectAtIndex:i%[barColors count]]CGColor]
                             ]
         ];
    }
}

- (void)setBarColors:(NSArray *)uiColorArray {
    barColors = [NSArray arrayWithArray:uiColorArray];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!animationStart) {
        animationStart = YES;
        animationTimer = [NSTimer scheduledTimerWithTimeInterval:.025 target:self selector:@selector(updateValue) userInfo:nil repeats:YES];
    }
    for (int i = 0; i < numOfBar; i++) {
        RCBar *thisBar = [barRects objectAtIndex:i];
        CGContextSetFillColorWithColor(context, [thisBar color]);
        CGContextFillRect(context, [thisBar rect]);
    }
}

- (void)updateValue {
    animationEnd = YES;
    for (int i = 0; i < numOfBar; i++) {
        RCBar *thisBar = [barRects objectAtIndex:i];
        [thisBar updateValue];
        if (0 < i) {
            RCBar *prevBar = [barRects objectAtIndex:i-1];
            [thisBar setRectOriginX: [prevBar rectOriginX]+[prevBar currSize].width];
        }
        animationEnd = (animationEnd && [thisBar isUpdateEnd]);
    }
    if (animationEnd) {
        [animationTimer invalidate];
        animationTimer = nil;
    }
    [self setNeedsDisplay];
}

@end
