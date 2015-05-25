//
//  TetrisGameField.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tetris.h"
#import "TetrisUnit.h"



@interface TetrisGameField : NSObject

@property (nonatomic, readonly) TTSize fieldSize;
@property (nonatomic, strong, readonly) NSArray *coordinates;

- (instancetype)initWithFieldSize:(TTSize)fieldSize;
- (BOOL)doesExistAtRow:(int)row column:(int)column;
- (TTBlockType)colorAtRow:(int)row column:(int)column;
- (TetrisUnit *)unitAtRow:(int)row column:(int)column;
- (void)setUnitWithColor:(TTBlockType)color AtRow:(int)row column:(int)column;
- (BOOL)isBoxesFullInRow:(int)row;
- (void)clearUnitAtRow:(int)row column:(int)column;
- (void)clearUnitsInRow:(int)row;
- (void)clearGameField;
- (void)moveRow:(int)rowFrom toRow:(int)rowTo;
- (void)moveDownRowsAboveRow:(int)row;
- (void)moveUpperRowDown:(int)row;
- (int)maxColumnIndex;
- (int)minColumnIndex;
- (int)maxRowIndex;
- (int)minRowIndex;
- (BOOL)isOutOfFieldAtPosition:(TTPosition *)position;
- (TTPosition *)startPositionOfBlock;


@end
