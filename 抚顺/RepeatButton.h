//
//  RepeatButton.h
//  HoldRepeatButton
//
//  Created by Albert Mao on 1/9/15.
//  Copyright (c) 2015 Albert Mao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HoldBlock)();
typedef void (^ReleaseBlock)();

@interface RepeatButton : UIButton
@property (nonatomic)NSTimeInterval repeatDuration;
- (void) actionWithHoldBlock:(HoldBlock)holdBlock raleasBlock:(ReleaseBlock)releasBlock;
@end
