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
    NSArray        *values;
    
    //Style
    UIFont   *font;
    UIColor  *lineColor;
    UIColor  *frameColor;
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
    BOOL     horizontalAxisDisplay;
    BOOL     textOfPointDisplay;
    BOOL     verticalBaseDisplay;
    BOOL     horizontalBaseDisplay;
}

@synthesize startWithValue = startWithValue;
@synthesize horizontalAxisDisplay = horizontalAxisDisplay;
@synthesize textOfPointDisplay = textOfPointDisplay;
@synthesize verticalBaseDisplay = verticalBaseDisplay;
@synthesize horizontalBaseDisplay = horizontalBaseDisplay;

#pragma mark -Initialize methods
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupDefaultSetting];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:frame];
        [self setupDefaultSetting];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupDefaultSetting];
    }
    return self;
}

#pragma mark -Setter methods
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    marginTop = 30.0f;
    marginRight = 30.0f;
    marginLeft = 30.0f;
    marginBottom = 30.0f;
    graphSize.width = frame.size.width - (marginRight + marginLeft);
    graphSize.height = frame.size.height - (marginTop + marginBottom);
}

- (void)setupDefaultSetting {
    SortType = @"ASC";
    startWithValue = NO;
    verticalBaseDisplay = NO;
    horizontalAxisDisplay = YES;
    horizontalBaseDisplay = YES;
    textOfPointDisplay = YES;
    [self setBackgroundColor:[UIColor colorWithRed:0.114f green:0.129f blue:0.145f alpha:1.00f]];
    lineColor = [UIColor colorWithRed:0.141f green:0.592f blue:0.843f alpha:1.00f];
    frameColor = [UIColor whiteColor];
}

- (void)setData:(NSArray *)dataArray {
    values = [dataArray copy];
    maxValue = 100.0f;
    minValue = 1.0f;
    verticalTerm = 5.0f;
    colnum = [values count];
}

#pragma mark -Draw methods
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawGrid:context];
    [self drawLine:context];
    [self drawTextOfPoint];
}

- (void)drawGrid:(CGContextRef)context {
    CGContextSetLineWidth(context, 0.5f);
    CGContextSetStrokeColorWithColor(context, [frameColor CGColor]);
    [self drawHorizontalAxis:context];
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
    CGContextSetStrokeColorWithColor(context, [lineColor CGColor]);
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

- (void)drawTextOfPoint {
    if (!textOfPointDisplay) return;
    for (int i = 0; i < colnum; i++) {
        float thisX = (graphSize.width) * ((i+1)/colnum);
        float value = [[values objectAtIndex:i] floatValue];
        float thisY = (graphSize.height - (graphSize.height)*(value/maxValue));
        [self drawText:[NSString stringWithFormat:@"%.0f", value] xPosition:marginLeft+thisX-5 yPosition:marginTop+thisY-15];
    }
}

- (void)drawText:(NSString *)text xPosition:(CGFloat)xPosition yPosition:(CGFloat)yPosition {
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentCenter;
    CGPoint point = CGPointMake(xPosition, yPosition);
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 12], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: textStyle};
    [text drawAtPoint:point withAttributes:textFontAttributes];
}

@end
