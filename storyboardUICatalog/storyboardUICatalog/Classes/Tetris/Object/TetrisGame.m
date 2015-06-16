//
//  TetrisGame.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "TetrisGame.h"

extern TTSize TTSizeMake(int width, int height);
extern TTUnitBox TTUnitBoxMake(TTBlockColor color);


@interface TetrisGame()


@end


@implementation TetrisGame
- (instancetype)init {
    self = [super init];
    if(self) {
        _gameField = [[TetrisGameField alloc] initWithFieldSize:TTSizeMake(10, 20)];
    }
    return self;
}

- (void)startGame {
    self.currentBlock = [TetrisBlock randomBlock];
    self.currentBlock.markPosition = [TTPosition positionWithRow:17 column:5];
    
    
}


@end
