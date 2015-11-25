//
//  RCLineChart.h
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCLineChart : UIView

@property (nonatomic, getter=isStartWithValue)      BOOL startWithValue;
@property (nonatomic, getter=isTextOfPointDisplay)  BOOL textOfPointDisplay;

@property (nonatomic, getter=isHorizontalAxisDisplay) BOOL horizontalAxisDisplay;
@property (nonatomic, getter=isVerticalBaseDisplay)   BOOL verticalBaseDisplay;
@property (nonatomic, getter=isHorizontalBaseDisplay) BOOL horizontalBaseDisplay;

- (void)setData:(NSArray *)dataArray;

@end
