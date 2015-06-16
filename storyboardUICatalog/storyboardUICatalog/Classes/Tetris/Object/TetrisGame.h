//
//  TetrisGame.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tetris.h"
#import "TetrisGameField.h"
#import "TetrisBlock.h"

@interface TetrisGame : NSObject

@property (nonatomic, strong, readonly) TetrisGameField *gameField;
@property (nonatomic, strong) TetrisBlock *currentBlock;

- (void)startGame;
@end
