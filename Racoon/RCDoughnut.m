//
//  RCDoughnut.m
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "RCDoughnut.h"

@implementation RCDoughnut

{
    RCData  *data;
    
    CGFloat radius;
    CGFloat padding;
    CGFloat doughnutWidth;
    UILabel *titleLabel;
    UILabel *numericLabel;
    
    UIColor *doughnutColor;
    
    BOOL animationEnd;
}

@synthesize titleLabel = titleLabel;
@synthesize doughnutWidth = doughnutWidth;

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

- (void)setupWithDefaultSetting {
    [self setBackgroundColor:[UIColor colorWithRed:0.114f green:0.129f blue:0.145f alpha:1.00f]];
    [self setupTitleLabel];
    [self setupNumericLabel];
    doughnutColor = [UIColor colorWithRed:0.259f green:0.698f blue:0.753f alpha:1.00f];
    doughnutWidth = 3;
}

- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    //background arc
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, center.x, center.y);
    CGContextAddArc(context, center.x, center.y, radius, -(M_PI/2), -(M_PI/2)+(M_PI*2), NO);
    CGContextClosePath(context);
    
    CGContextMoveToPoint(context, center.x, center.y);
    CGContextAddArc(context, center.x, center.y, radius-doughnutWidth, -(M_PI/2), -(M_PI/2)+(M_PI*2), NO);
    CGContextClosePath(context);
    
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0.341f green:0.361f blue:0.376f alpha:1.00f] CGColor]);
    CGContextEOFillPath(context);
    
    //outer arc
    CGContextMoveToPoint(context, center.x, center.y);
    CGContextAddArc(context, center.x, center.y, radius, -(M_PI/2), -(M_PI/2)+(M_PI*2) * [data currValue], NO);
    CGContextClosePath(context);
    
    CGContextMoveToPoint(context, center.x, center.y);
    CGContextAddArc(context, center.x, center.y, radius-doughnutWidth, -(M_PI/2), -(M_PI/2)+(M_PI*2) * [data currValue], NO);
    CGContextClosePath(context);
    CGContextSetFillColorWithColor(context, [doughnutColor CGColor]);
    CGContextEOFillPath(context);
    
    [numericLabel setText:[NSString stringWithFormat:@"%.f%%", [data currValue]*100]];
    
    if (!animationEnd) {
        [NSTimer scheduledTimerWithTimeInterval:.025 target:self selector:@selector(updateValue) userInfo:nil repeats:NO];
    }
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    radius = (frame.size.width > frame.size.height) ? frame.size.height/2 : frame.size.width/2;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [titleLabel setFrame:CGRectMake(0, (self.frame.size.height/2)-10, self.frame.size.width, 20)];
    [numericLabel setFrame:CGRectMake(0, (self.frame.size.height/2)+5, self.frame.size.width, 20)];
}

- (void)setupTitleLabel {
    titleLabel = [[UILabel alloc] init];
    [titleLabel setTextColor:[UIColor colorWithRed:0.769f green:0.769f blue:0.780f alpha:1.00f]];
    [titleLabel setFont:[UIFont systemFontOfSize:15]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:titleLabel];
}

- (void)setupNumericLabel {
    numericLabel = [[UILabel alloc] init];
    [numericLabel setTextColor:[UIColor colorWithRed:0.769f green:0.769f blue:0.780f alpha:1.00f]];
    [numericLabel setFont:[UIFont systemFontOfSize:15]];
    [numericLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:numericLabel];
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

- (void)updateValue {
    [data updateValue];
    animationEnd = [data isUpdateEnd];
    [self setNeedsDisplay];
}

@end
