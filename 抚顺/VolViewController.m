//
//  VolViewController.m
//  抚顺
//
//  Created by wharlim on 15/7/22.
//  Copyright (c) 2015年 wharlim. All rights reserved.
//

#import "VolViewController.h"
#import "AppDelegate.h"

@interface VolViewController ()
@property (strong, nonatomic) IBOutlet UISlider *vol1;
@property (strong, nonatomic) IBOutlet UISlider *vol2;
@property (strong, nonatomic) IBOutlet UISlider *vol3;
@property (strong, nonatomic) IBOutlet UISlider *vol4;
@property (strong, nonatomic) IBOutlet UISlider *vol5;
@property (strong, nonatomic) IBOutlet UIButton *vol_mute_1;
@property (strong, nonatomic) IBOutlet UIButton *vol_mute_2;
@property (strong, nonatomic) IBOutlet UIButton *vol_mute_3;
@property (strong, nonatomic) IBOutlet UIButton *vol_mute_4;
@property (strong, nonatomic) IBOutlet UIButton *vol_mute_5;

@end

@implementation VolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for (long i = 1211; i <= 1215; i++) {
        UIButton *btn = (UIButton *)[self.view viewWithTag:i];
        [btn setBackgroundImage:[UIImage imageNamed:@"mute_down.png"] forState:UIControlStateSelected];
        NSNumber *isSelect = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%ld",i]];
        if (isSelect && [isSelect intValue] == 1) {
            [btn setSelected:YES];
        }
    }
    
    for (long i = 1201; i <= 1205; i++) {
        UISlider *slider = (UISlider *)[self.view viewWithTag:i];
        NSNumber *sliderValue = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%ld",i]];
        if (sliderValue) {
            [slider setValue:[sliderValue floatValue]];
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheView:) name:@"RevData" object:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)volChange:(UISlider *)sender {
    if (sender.tag == 1201) {
        [[AppDelegate app] sendCom:[NSString stringWithFormat:@"BA%03d",(int)sender.value]];
    }else if (sender.tag == 1202) {
        [[AppDelegate app] sendCom:[NSString stringWithFormat:@"BB%03d",(int)sender.value]];
    }else if (sender.tag == 1203) {
        [[AppDelegate app] sendCom:[NSString stringWithFormat:@"BC%03d",(int)sender.value]];
    }else if (sender.tag == 1204) {
        [[AppDelegate app] sendCom:[NSString stringWithFormat:@"BD%03d",(int)sender.value]];
    }else if (sender.tag == 1205) {
        [[AppDelegate app] sendCom:[NSString stringWithFormat:@"BE%03d",(int)sender.value]];
    }
    [[NSUserDefaults standardUserDefaults]setValue:[NSNumber numberWithInteger:(int)sender.value] forKey:[NSString stringWithFormat: @"%d", (int)sender.tag]];
}

- (IBAction)muteChange:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.tag == 1211) {
        [[AppDelegate app] sendCom:[NSString stringWithFormat:@"BF%03d",sender.selected?1:0]];
    }else if (sender.tag == 1212) {
        [[AppDelegate app] sendCom:[NSString stringWithFormat:@"BG%03d",sender.selected?1:0]];
    }else if (sender.tag == 1213) {
        [[AppDelegate app] sendCom:[NSString stringWithFormat:@"BH%03d",sender.selected?1:0]];
    }else if (sender.tag == 1214) {
        [[AppDelegate app] sendCom:[NSString stringWithFormat:@"BI%03d",sender.selected?1:0]];
    }else if (sender.tag == 1215) {
        [[AppDelegate app] sendCom:[NSString stringWithFormat:@"BJ%03d",sender.selected?1:0]];
    }
    [[NSUserDefaults standardUserDefaults]setValue:[NSNumber numberWithInteger:sender.selected?1:0] forKey:[NSString stringWithFormat: @"%d", (int)sender.tag]];
    
}

-(void)changeTheView:(id)sender{
    NSString *rev = [[sender userInfo] objectForKey:@"rev"];    //0,000,0,000,0,000,0,000,0,000   这样的格式，第一位是静音，三四五位是音量
 
    NSString *str = [rev substringWithRange:NSMakeRange(0, 1)];
    [self changeTheMute:(UIButton *)[self.view viewWithTag:1211]  withMuteStr:str];
    
    str = [rev substringWithRange:NSMakeRange(2, 3)];
    [self changeTheVol:(UISlider *)[self.view viewWithTag:1201] withVolStr:str];
//
    str = [rev substringWithRange:NSMakeRange(6, 1)];
    [self changeTheMute:(UIButton *)[self.view viewWithTag:1212]  withMuteStr:str];

    str = [rev substringWithRange:NSMakeRange(8, 3)];
    [self changeTheVol:(UISlider *)[self.view viewWithTag:1202] withVolStr:str];
//
    str = [rev substringWithRange:NSMakeRange(12, 1)];
    [self changeTheMute:(UIButton *)[self.view viewWithTag:1213]  withMuteStr:str];
    
    str = [rev substringWithRange:NSMakeRange(14, 3)];
    [self changeTheVol:(UISlider *)[self.view viewWithTag:1203] withVolStr:str];
//
    str = [rev substringWithRange:NSMakeRange(18, 1)];
    [self changeTheMute:(UIButton *)[self.view viewWithTag:1214]  withMuteStr:str];
    
    str = [rev substringWithRange:NSMakeRange(20, 3)];
    [self changeTheVol:(UISlider *)[self.view viewWithTag:1204] withVolStr:str];
//
    str = [rev substringWithRange:NSMakeRange(24, 1)];
    [self changeTheMute:(UIButton *)[self.view viewWithTag:1215]  withMuteStr:str];
    
    str = [rev substringWithRange:NSMakeRange(26, 3)];
    [self changeTheVol:(UISlider *)[self.view viewWithTag:1205] withVolStr:str];
    
  
    
}

-(void)changeTheMute:(UIButton *)btn_mute withMuteStr:(NSString *)muteStr{
    if ([muteStr isEqualToString:@"1"]) {
        [btn_mute setSelected:YES];
    }else{
        [btn_mute setSelected:NO];
    }
}

-(void)changeTheVol:(UISlider *)slider_vol withVolStr:(NSString *)volstr{
    int volValue = [volstr intValue];
    [slider_vol setValue:volValue animated:YES];
}


@end
