//
//  RCStackBar.h
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCBar.h"

@interface RCStackBar : UIView

@property (nonatomic, strong) NSArray *barColors;

- (void)setData:(NSArray *)dataArray;

@end
