//
//  RCDoughnut.m - > RCGauge.m
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "RCGauge.h"

@implementation RCGauge

{
    RCData  *data;
    
    CGFloat radius;
    CGFloat padding;
    UILabel *titleLabel;
    UILabel *valueLabel;
    
    UIColor *gaugeColor;
    CGFloat gaugeWidth;
    
    NSString *timing;
    BOOL animationEnd;
}

@synthesize titleLabel = titleLabel;
@synthesize gaugeWidth = gaugeWidth;

- (instancetype)init {
    self = [super init];
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

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupWithDefaultSetting];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [titleLabel setFrame:CGRectMake(0, (self.frame.size.height/2)-10, self.frame.size.width, 20)];
    [valueLabel setFrame:CGRectMake(0, (self.frame.size.height/2)+5, self.frame.size.width, 20)];
    radius = (self.frame.size.width > self.frame.size.height) ? self.frame.size.height/2 : self.frame.size.width/2;
}

- (void)setupWithDefaultSetting {
    [self setBackgroundColor:[UIColor colorWithRed:0.114f green:0.129f blue:0.145f alpha:1.00f]];
    [self setupTitleLabel];
    [self setupValueLabel];
    gaugeColor = [UIColor colorWithRed:0.259f green:0.698f blue:0.753f alpha:1.00f];
    gaugeWidth = 3;
    timing = @"ease";
}

- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    //background arc
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, center.x, center.y);
    CGContextAddArc(context, center.x, center.y, radius, -(M_PI/2), -(M_PI/2)+(M_PI*2), NO);
    CGContextClosePath(context);
    
    CGContextMoveToPoint(context, center.x, center.y);
    CGContextAddArc(context, center.x, center.y, radius-gaugeWidth, -(M_PI/2), -(M_PI/2)+(M_PI*2), NO);
    CGContextClosePath(context);
    
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0.341f green:0.361f blue:0.376f alpha:1.00f] CGColor]);
    CGContextEOFillPath(context);
    
    //outer arc
    CGContextMoveToPoint(context, center.x, center.y);
    CGContextAddArc(context, center.x, center.y, radius, -(M_PI/2), -(M_PI/2)+(M_PI*2) * [data currValue], NO);
    CGContextClosePath(context);
    
    CGContextMoveToPoint(context, center.x, center.y);
    CGContextAddArc(context, center.x, center.y, radius-gaugeWidth, -(M_PI/2), -(M_PI/2)+(M_PI*2) * [data currValue], NO);
    CGContextClosePath(context);
    CGContextSetFillColorWithColor(context, [gaugeColor CGColor]);
    CGContextEOFillPath(context);
    
    [valueLabel setText:[NSString stringWithFormat:@"%.f%%", [data currValue]*100]];
    
    if (!animationEnd) {
        [NSTimer scheduledTimerWithTimeInterval:.025 target:self selector:@selector(updateValue) userInfo:nil repeats:NO];
    }
}

- (void)setupTitleLabel {
    titleLabel = [[UILabel alloc] init];
    [titleLabel setTextColor:[UIColor colorWithRed:0.769f green:0.769f blue:0.780f alpha:1.00f]];
    [titleLabel setFont:[UIFont systemFontOfSize:15]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:titleLabel];
}

- (void)setupValueLabel {
    valueLabel = [[UILabel alloc] init];
    [valueLabel setTextColor:[UIColor colorWithRed:0.769f green:0.769f blue:0.780f alpha:1.00f]];
    [valueLabel setFont:[UIFont systemFontOfSize:15]];
    [valueLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:valueLabel];
}

- (void)setData:(float)ratioValue {
    if (isnan(ratioValue)) ratioValue = 0;
    data = [[RCData alloc] initWithValue:ratioValue];
    
    animationEnd = NO;
}

- (void)setTitle:(NSString *)title {
    [[self titleLabel] setText:title];
}

- (void)setTitleColor:(UIColor*)uiColor {
    [[self titleLabel] setTextColor:uiColor];
}

- (void)setTitleFont:(UIFont *)font {
    [[self titleLabel] setFont:font];
}

- (void)setGaugeColor:(UIColor*)uiColor {
    gaugeColor = uiColor;
}

- (void)setTiming:(NSString *)aTiming {
    if ([aTiming isEqual: @"linear"] || [aTiming isEqual: @"ease"]) {
        timing = aTiming;
    } else {
        timing = @"ease";
    }
}

- (void)updateValue {
    [data updateValue];
    animationEnd = [data isUpdateEnd];
    [self setNeedsDisplay];
}

@end
