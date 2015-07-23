//
//  matrixViewController.m
//  抚顺
//
//  Created by wharlim on 15/7/23.
//  Copyright (c) 2015年 wharlim. All rights reserved.
//

#import "matrixViewController.h"
#import "AppDelegate.h"

@interface matrixViewController ()
@property (weak, nonatomic) IBOutlet UILabel *inputNum;
@property (weak, nonatomic) IBOutlet UILabel *outputNum;

@end

@implementation matrixViewController

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
   // NSLog(@"%ld",sender.tag);
    if (sender.tag <= 1508) {
        self.inputNum.text = [NSString stringWithFormat:@"%ld",((long)sender.tag - 1500)];
        self.outputNum.text = @"";
    } else {
        self.outputNum.text = [NSString stringWithFormat:@"%ld",((long)sender.tag - 1508)];
        if (self.inputNum.text == nil) {
        }else{
             NSLog(@"%@",[NSString stringWithFormat:@"D0%@%@",self.inputNum.text,self.outputNum.text]);
            [[AppDelegate app] sendCom:[NSString stringWithFormat:@"D00%@%@",self.inputNum.text,self.outputNum.text]];
        
        }
    }
    
    
}




@end
