//
//  ViewController.m
//  Racoon
//
//  Created by mocca on 2015. 10. 27..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithRed:0.114f green:0.129f blue:0.145f alpha:1.00f]];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 25, [[UIScreen mainScreen] bounds].size.width - 10, 35)];
    [titleLabel setText:@"Racoon Graph Library"];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:25]];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [[self view] addSubview:titleLabel];
    
    
    TestView *testView = [[TestView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+15, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [[self view] addSubview:testView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
