//
//  RepeatButton.m
//  HoldRepeatButton
//
//  Created by Albert Mao on 1/9/15.
//  Copyright (c) 2015 Albert Mao. All rights reserved.
//

#import "RepeatButton.h"

@interface RepeatButton()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) HoldBlock holdBlock;
@property (nonatomic, copy) ReleaseBlock releasBlock;
@end

@implementation RepeatButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}



- (void) setup
{
    self.repeatDuration = 0.2;
    
    [self addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUp) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(touchUp) forControlEvents:UIControlEventTouchUpOutside];
    
}

- (void)touchDown
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.repeatDuration
                                                  target:self
                                                selector:@selector(action)
                                                userInfo:nil
                                                 repeats:YES];
    
}

-(void) action
{
    if (self.holdBlock) {
        self.holdBlock();
    }
}

- (void)touchUp
{

    [self.timer invalidate];
    self.timer = nil;
    if (self.releasBlock) {
        self.releasBlock();
    }
}


- (void) actionWithHoldBlock:(HoldBlock)holdBlock raleasBlock:(ReleaseBlock)releasBlock
{
    self.holdBlock = [holdBlock copy];
    self.releasBlock = [releasBlock copy];
}

@end
