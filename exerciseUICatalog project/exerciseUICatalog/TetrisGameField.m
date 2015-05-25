//
//  TetrisGameField.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "TetrisGameField.h"

extern TTSize TTSizeMake(int width, int height);
extern TTUnitBox TTUnitBoxMake(TTBlockColor color);


@implementation TetrisGameField

#pragma mark - init method
- (instancetype)init {
    return [self initWithFieldSize:TTSizeMake(10, 20)];
}

- (instancetype)initWithFieldSize:(TTSize)fieldSize {
    self = [super init];
    if(self) {
        _fieldSize = fieldSize;
        NSMutableArray *rowsInField = [[NSMutableArray alloc] init];
        for (int i=0; i<_fieldSize.height; i++) {
            NSMutableArray *unitsInRow = [[NSMutableArray alloc] init];
            for(int j=0; j<_fieldSize.width; j++) {
                TetrisUnit *unit = [[TetrisUnit alloc] initWithPosition:[TTPosition positionWithRow:i column:j]];
                [unitsInRow addObject:unit];
            }
            [rowsInField addObject:[NSArray arrayWithArray:unitsInRow]];
        }
        _coordinates = [NSArray arrayWithArray:rowsInField];
    }
    return self;
}


- (BOOL)doesExistAtRow:(int)row column:(int)column {
    TetrisUnit *unit = self.coordinates[row][column];
    return unit.exist;
}

- (TTBlockType)colorAtRow:(int)row column:(int)column {
    TetrisUnit *unit = self.coordinates[row][column];
    return unit.color;
}

- (TetrisUnit *)unitAtRow:(int)row column:(int)column {
    TetrisUnit *unit = self.coordinates[row][column];
    return unit;
}

- (void)setUnitWithColor:(TTBlockType)color AtRow:(int)row column:(int)column {
    TetrisUnit *unit = self.coordinates[row][column];
    unit.exist = YES;
    unit.color = color;
}

- (BOOL)isBoxesFullInRow:(int)row {
    NSArray *boxesInRow = self.coordinates[row];
    for(TetrisUnit *unit in boxesInRow) {
        if(!unit.exist) return NO;
    }
    return YES;
}

- (void)clearUnitAtRow:(int)row column:(int)column {
    TetrisUnit *unit = self.coordinates[row][column];
    unit.exist = NO;
    unit.color = TTBlockColorNone;
}

- (void)clearUnitsInRow:(int)row {
    NSArray *boxesInRow = self.coordinates[row];
    for(TetrisUnit *unit in boxesInRow) {
        unit.exist = NO;
        unit.color = TTBlockColorNone;
    }
}

- (void)clearGameField {
    for (NSArray *unitsInRow in self.coordinates) {
        for (TetrisUnit *unit in unitsInRow) {
            unit.exist = NO;
            unit.color = TTBlockColorNone;
        }
    }
}

- (void)moveDownRowsAboveRow:(int)row {
    int i;
    for(i = row+1; i<self.fieldSize.height; i++) {
        [self moveUpperRowDown:i];
    }
}

- (void)moveUpperRowDown:(int)row {
    if(row<1) return;
    NSArray *copyFrom = self.coordinates[row];
    NSArray *copyTo = self.coordinates[row-1];
    for (int i=0; i<[copyFrom count]; i++) {
        TetrisUnit *unitFrom = copyFrom[i];
        TetrisUnit *unitTo = copyTo[i];
        [unitFrom copyToUnit:unitTo];
    }
    [self clearUnitsInRow:row];
}


- (int)maxColumnIndex {
    return self.fieldSize.width -1;
}

- (int)minColumnIndex {
    return 0;
}

- (int)maxRowIndex {
    return self.fieldSize.height -1;
}

- (int)minRowIndex {
    return 0;
}

- (BOOL)isOutOfFieldAtPosition:(TTPosition *)position {
    if(position.row<0 || position.row>=self.fieldSize.height || position.column<0 || position.column>=self.fieldSize.width)
        return YES;
    else return NO;
}


- (TTPosition *)startPositionOfBlock {
    int row = self.fieldSize.height-1;
    int column = self.fieldSize.width/2;
    return [TTPosition positionWithRow:row column:column];
}

@end
