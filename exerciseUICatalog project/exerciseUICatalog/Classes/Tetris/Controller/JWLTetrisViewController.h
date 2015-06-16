//
//  JWLTetrisViewController.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 7..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tetris.h"
#import "JWLTetrisView.h"
#import "UIColor+TintColor.h"
#import "JWLButtonWithTimer.h"

@interface JWLTetrisViewController : UIViewController

@property (nonatomic, strong) UIButton *leftButton;
@property (atomic, strong) NSTimer *progressTimer;
@end
