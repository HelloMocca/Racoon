//
//  RCLineChart.m
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "RCLineChart.h"

@implementation RCLineChart

{
    UILabel        *titleLabel;
    NSArray        *values;
    NSMutableArray *valueOfPoints;
    
    float    maxValue;
    float    minValue;
    float    verticalTerm;
    float    colnum;
    NSString *SortType;
    CGSize   graphSize;
    float    marginTop;
    float    marginRight;
    float    marginBottom;
    float    marginLeft;
    BOOL     startWithValue;
    BOOL     verticalAxisDisplay;
    BOOL     horizontalAxisDisplay;
    BOOL     valueOfPointDisplay;
    BOOL     verticalBaseDisplay;
    BOOL     horizontalBaseDisplay;
}

@synthesize titleLabel = titleLabel;
@synthesize startWithValue = startWithValue;
@synthesize verticalAxisDisplay = verticalAxisDisplay;
@synthesize horizontalAxisDisplay = horizontalAxisDisplay;
@synthesize valueOfPointDisplay = valueOfPointDisplay;
@synthesize verticalBaseDisplay = verticalBaseDisplay;
@synthesize horizontalBaseDisplay = horizontalBaseDisplay;

#pragma mark -Initialize methods
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSettingValues];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:frame];
        [self setupSettingValues];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupSettingValues];
    }
    return self;
}

- (void)setupSettingValues {
    SortType = @"ASC";
    startWithValue = NO;
    verticalAxisDisplay = NO;
    verticalBaseDisplay = NO;
    horizontalAxisDisplay = YES;
    horizontalBaseDisplay = YES;
    valueOfPointDisplay = YES;
    [self setValues];
}

#pragma mark -Draw methods
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawGrid:context];
    [self drawLine:context];
    [self drawValueOfPoint];
}

- (void)drawGrid:(CGContextRef)context {
    CGContextSetLineWidth(context, 0.5f);
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    [self drawHorizontalAxis:context];
    [self drawVerticalAxis:context];
    [self drawHorizontalBase];
    [self drawVerticalBase];
}

- (void)drawHorizontalAxis:(CGContextRef)context {
    if (!horizontalAxisDisplay) return;
    for (int i = 0; i < verticalTerm+1; i++) {
        CGContextMoveToPoint(context, marginLeft, marginTop+(graphSize.height-
                                                             (graphSize.height*(i/verticalTerm))));
        CGContextAddLineToPoint(context, marginLeft+graphSize.width, marginTop+(graphSize.height-
                                                                                (graphSize.height*(i/verticalTerm))));
    }
    CGContextStrokePath(context);
}

- (void)drawVerticalAxis:(CGContextRef)context {
    if (!verticalAxisDisplay) return;
}

- (void)drawHorizontalBase {
    if (!horizontalBaseDisplay) return;
    for (int i = 0; i < colnum; i++) {
        float thisX = (graphSize.width) * ((i+1)/colnum);
        [self drawText:[NSString stringWithFormat:@"%d", i] xPosition:marginLeft+thisX yPosition:marginTop+graphSize.height];
    }
}

- (void)drawVerticalBase {
    if (!verticalBaseDisplay) return;
    for (int i = 0; i < verticalTerm+1; i++) {
        NSString *text = [NSString stringWithFormat:@"%.0f", maxValue/verticalTerm*i];
        [self drawText:text xPosition:marginLeft yPosition:marginTop-13+(graphSize.height-
                                                                         (graphSize.height*(i/verticalTerm)))];
    }
}

- (void)drawLine:(CGContextRef)context {
    CGContextSetLineWidth(context, 3.0f);
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:0.141f green:0.592f blue:0.843f alpha:1.00f] CGColor]);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGContextMoveToPoint(context, marginLeft, marginTop+graphSize.height);
    for (int i = 0; i < colnum; i++) {
        float thisX = (graphSize.width) * ((i+1)/colnum);
        float value = [[values objectAtIndex:i] floatValue];
        float thisY = (graphSize.height - (graphSize.height)*(value/maxValue));
        CGContextAddLineToPoint(context, marginLeft+thisX, marginTop+thisY);
    }
    CGContextStrokePath(context);
}

- (void)drawValueOfPoint {
    for (int i = 0; i < colnum; i++) {
        float thisX = (graphSize.width) * ((i+1)/colnum);
        float value = [[values objectAtIndex:i] floatValue];
        float thisY = (graphSize.height - (graphSize.height)*(value/maxValue));
        [self drawText:[NSString stringWithFormat:@"%.0f", value] xPosition:marginLeft+thisX-5 yPosition:marginTop+thisY-15];
    }
}

- (void)drawText:(NSString *)text xPosition:(CGFloat)xPosition yPosition:(CGFloat)yPosition
{
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentCenter;
    CGPoint point = CGPointMake(xPosition, yPosition);
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 12], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: textStyle};
    [text drawAtPoint:point withAttributes:textFontAttributes];
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    marginTop = 40.0f;
    marginRight = 30.0f;
    marginLeft = 30.0f;
    marginBottom = 30.0f;
    graphSize.width = frame.size.width - (marginRight + marginLeft);
    graphSize.height = frame.size.height - (marginTop + marginBottom);
}

- (void)setValues {
    values = [NSArray arrayWithObjects:@(75.0f),@(45.0f),@(91.0f),@(55.0f),nil];
    maxValue = 100.0f;
    minValue = 1.0f;
    verticalTerm = 5.0f;
    colnum = values.count;
}

- (void)setTitle:(NSString *)title {
    [titleLabel removeFromSuperview];
    titleLabel = [[UILabel alloc] initWithFrame:
                  CGRectMake(0, 10, self.frame.size.width, 20)];
    [titleLabel setText:title];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:titleLabel];
}

@end
