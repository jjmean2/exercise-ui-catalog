//
//  TetrisGameManager.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 22..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tetris.h"
#import "TetrisGameField.h"
#import "TetrisBlock.h"
#import "TTPosition.h"

@interface TetrisGameManager : NSObject

@property (nonatomic, strong, readonly) TetrisGameField *gameField;
@property (atomic, strong) TetrisBlock *currentBlock;
@property (nonatomic, strong) TetrisBlock *nextBlock;
@property (nonatomic, strong, readonly) NSMutableDictionary *colorSetting;
@property (nonatomic) CGFloat boxLength;
@property (nonatomic, setter=setFieldFrameInBounds:) CGRect fieldFrame;
@property (nonatomic, strong) NSTimer *progressTimer;


#pragma mark - init method
- (instancetype)initWithGameFieldSize:(TTSize)fieldSize;

#pragma mark - drawing helper
- (CGRect)CGRectForBoxAtPosition:(TTPosition *)position;
//- (void)setFieldFrameInBounds:(CGRect)bounds;

#pragma mark - collision check
- (BOOL)isCollideWithExistingBoxAtPosition:(TTPosition *)position;
- (BOOL)block:(TetrisBlock *)block canMoveToMarkPosition:(TTPosition *)markPosition;
- (TTBlockOutType)typeOfOutPositionOfBlock:(TetrisBlock *)block;

#pragma mark - row completion check
- (BOOL)isBoxFullInRow:(int)row;


#pragma mark - control block method
- (void)moveCurrentBlockDown;
- (void)moveCurrentBlockLeft;
- (void)moveCurrentBlockRight;
- (void)moveCurrentBlockUp;
- (void)changeCurrentBlockOrientation;
- (void)adjustPositionOfBlock;

#pragma mark - starter
- (void)startNewGame;

#pragma mark - configure
- (void)configureGame;
- (UIColor *)colorForBlockType:(TTBlockType)blockType;

@end
