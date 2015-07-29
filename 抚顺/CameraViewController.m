//
//  CameraViewController.m
//  抚顺
//
//  Created by wharlim on 15/7/21.
//  Copyright (c) 2015年 wharlim. All rights reserved.
//

#import "CameraViewController.h"
#import "AppDelegate.h"
#import "RepeatButton.h"

@interface CameraViewController ()
@property (weak, nonatomic) IBOutlet UIButton *cam1_save;
@property (weak, nonatomic) IBOutlet UIButton *cam1_recall;
@property (weak, nonatomic) IBOutlet UIButton *cam2_save;
@property (weak, nonatomic) IBOutlet UIButton *cam2_recall;



@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.cam1_save setSelected:YES];
//    [self.cam1_recall setSelected:NO];
//    [self.cam2_save setSelected:YES];
//    [self.cam2_recall setSelected:NO];
    UIButton *btnSave = (UIButton *)[self.view viewWithTag:1307];
     UIButton *btnRecall = (UIButton *)[self.view viewWithTag:1308];
    UIButton *btnSave2 = (UIButton *)[self.view viewWithTag:1357];
    UIButton *btnRecall2 = (UIButton *)[self.view viewWithTag:1358];

    [btnSave setBackgroundImage:[UIImage imageNamed:@"camera_btnBackBlue.png"] forState:UIControlStateSelected];
    [btnRecall setBackgroundImage:[UIImage imageNamed:@"camera_btnBackBlue.png"] forState:UIControlStateSelected];
    [btnSave2 setBackgroundImage:[UIImage imageNamed:@"camera_btnBackBlue.png"] forState:UIControlStateSelected];
    [btnRecall2 setBackgroundImage:[UIImage imageNamed:@"camera_btnBackBlue.png"] forState:UIControlStateSelected];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cam1PanSendCom:(UIButton *)sender {
     [[AppDelegate app] sendCom:[NSString stringWithFormat:@"C%ld",sender.tag]];
}

- (IBAction)cam1PanSendComStop:(UIButton *)sender {
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"C%ld",sender.tag + 100]];
    
}


- (IBAction)cam1SaveAndRecall:(UIButton *)sender {
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"C%ld",sender.tag]];
    if (sender.tag == 1307) {
        [self.cam1_save setSelected:YES];
        [self.cam1_recall setSelected:NO];
    }
    if (sender.tag == 1308) {
        [self.cam1_save setSelected:NO];
        [self.cam1_recall setSelected:YES];
    }
    
    
    if (sender.tag == 1357) {
        [self.cam2_save setSelected:YES];
        [self.cam2_recall setSelected:NO];
    }
    if (sender.tag == 1358) {
        [self.cam2_save setSelected:NO];
        [self.cam2_recall setSelected:YES];
    }
}




@end
