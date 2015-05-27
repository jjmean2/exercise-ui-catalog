//
//  JWLTetrisView.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 7..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tetris.h"
#import "TetrisGame.h"
#import "TetrisGameField.h"
#import "TetrisBlock.h"
#import "TTPosition.h"
#import "TetrisUnit.h"
#import "TetrisGameManager.h"

@interface JWLTetrisView : UIView

@property (nonatomic, strong) TetrisGameManager *gameManager;
@property (nonatomic) CGRect visibleFrame;

@end
