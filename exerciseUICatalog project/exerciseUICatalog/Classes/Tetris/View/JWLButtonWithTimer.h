//
//  JWLButtonWithTimer.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 22..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tetris.h"

@interface JWLButtonWithTimer : UIButton

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) TTButtonMoveDirection moveDirection;

@end
