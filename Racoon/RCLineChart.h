//
//  RCLineChart.h
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCLineChart : UIView

@property (nonatomic, readwrite)             UILabel *titleLabel;

@property (nonatomic, getter=isStartWithValue)      BOOL startWithValue;
@property (nonatomic, getter=isValueOfPointDisplay) BOOL valueOfPointDisplay;

@property (nonatomic, getter=isVerticalAxisDisplay)   BOOL verticalAxisDisplay;
@property (nonatomic, getter=isHorizontalAxisDisplay) BOOL horizontalAxisDisplay;

@property (nonatomic, getter=isVerticalBaseDisplay)   BOOL verticalBaseDisplay;
@property (nonatomic, getter=isHorizontalBaseDisplay) BOOL horizontalBaseDisplay;

- (void)setTitle:(NSString *)title;

@end
