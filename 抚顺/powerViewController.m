//
//  powerViewController.m
//  抚顺
//
//  Created by wharlim on 15/7/23.
//  Copyright (c) 2015年 wharlim. All rights reserved.
//

#import "powerViewController.h"
#import "AppDelegate.h"

@interface powerViewController ()

@end

@implementation powerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIView *btn in self.view.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            [(UIButton *)btn addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)send:(UIButton *)sender {
    NSLog(@"A%ld",sender.tag);
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"A%ld",sender.tag]];
}

@end
