//
//  RCSingleBar.m
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "RCSingleBar.h"

@implementation RCSingleBar

{
    RCData *data;
    BOOL endAnimation;
}


#pragma mark -Initialize methods

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setBackgroundColor:[UIColor colorWithRed:0.059f green:0.184f blue:0.216f alpha:1.00f]];
}

- (void)setData:(float)aData {
    data = [[RCData alloc] initWithValue:aData];
    endAnimation = NO;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0.263f green:0.706f blue:0.765f alpha:1.00f] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width*[data currValue], self.frame.size.height));
    if (!endAnimation) {
        [NSTimer scheduledTimerWithTimeInterval:.025 target:self selector:@selector(updateValue) userInfo:nil repeats:NO];
    }
}

- (void)updateValue {
    [data updateValue];
    endAnimation = [data isUpdateEnd];
    
    [self setNeedsDisplay];
}

@end
