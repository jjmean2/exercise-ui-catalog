//
//  TetrisGameManager.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 22..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "TetrisGameManager.h"
#import "UIColor+TintColor.h"

extern TTSize TTSizeMake(int width, int height);
extern TTUnitBox TTUnitBoxMake(TTBlockColor color);

@interface TetrisGameManager()

@end


@implementation TetrisGameManager

#pragma mark - init method
- (instancetype)init {
    return [self initWithGameFieldSize:TTSizeMake(10, 20)];
}

- (instancetype)initWithGameFieldSize:(TTSize)fieldSize {
    self = [super init];
    if(self) {
        _gameField = [[TetrisGameField alloc] initWithFieldSize:fieldSize];
        
        _colorSetting = [[NSMutableDictionary alloc] init];
        [_colorSetting setObject:[UIColor redColor] forKey:@(TTBlockTypeIShape)];
        [_colorSetting setObject:[UIColor blueColor] forKey:@(TTBlockTypeJShape)];
        [_colorSetting setObject:[UIColor yellowColor] forKey:@(TTBlockTypeLShape)];
        [_colorSetting setObject:[UIColor greenColor] forKey:@(TTBlockTypeOShape)];
        [_colorSetting setObject:[UIColor skyblueColor] forKey:@(TTBlockTypeSShape)];
        [_colorSetting setObject:[UIColor magentaColor] forKey:@(TTBlockTypeTShape)];
        [_colorSetting setObject:[UIColor orangeColor] forKey:@(TTBlockTypeZShape)];
        [_colorSetting setObject:[UIColor clearColor] forKey:@(TTBlockTypeNone)];
        _boxLength = 20.0;
        _fieldFrame.size.width = _gameField.fieldSize.width *_boxLength;
        _fieldFrame.size.height = _gameField.fieldSize.height *_boxLength;

    }
    return self;
}

#pragma mark - property setter

// fieldFrame setter
- (void)setFieldFrameInBounds:(CGRect)bounds {
    CGRect fieldFrame = self.fieldFrame;
    
    fieldFrame.origin.x = bounds.origin.x + (int)((bounds.size.width - fieldFrame.size.width)/2.0);
    fieldFrame.origin.y = bounds.origin.y + (int)((bounds.size.height - fieldFrame.size.height)/2.0);
    _fieldFrame = fieldFrame;
}

#pragma mark - drawing helper
- (CGRect)CGRectForBoxAtPosition:(TTPosition *)position {
    CGRect fieldFrame = self.fieldFrame;
    CGFloat boxWidth = fieldFrame.size.width / self.gameField.fieldSize.width;
    CGFloat boxHeight = fieldFrame.size.height / self.gameField.fieldSize.height;
    
    CGRect rect;
    CGPoint starter = CGPointMake(fieldFrame.origin.x, fieldFrame.origin.y + fieldFrame.size.height - boxHeight);
    rect.size = CGSizeMake(boxWidth, boxHeight);
    rect.origin = CGPointMake(starter.x + position.column * boxWidth, starter.y - position.row * boxHeight);
    
    return rect;
}



#pragma mark - collision check
- (BOOL)isCollideWithExistingBoxAtPosition:(TTPosition *)position {
    
    return NO;
}

- (BOOL)block:(TetrisBlock *)block canMoveToMarkPosition:(TTPosition *)markPosition {
    NSArray *positions = [block positionsOfBoxesFromMarkPosition:markPosition];
    for (TTPosition *p in positions) {
        if([self.gameField isOutOfFieldAtPosition:p]) {
            return NO;
        }
        int row = p.row;
        int column = p.column;
        TetrisUnit *unit = [self.gameField unitAtRow:row column:column];
        if(unit.exist)  return NO;
        
    }

    return YES;
}

- (TTBlockOutType)typeOfOutPositionOfBlock:(TetrisBlock *)block {
    TTBlockOutType result = TTBlockOutTypeNone;

    NSArray *positions = [block positionsOfBoxes];
    for (TTPosition *p in positions) {
        if([self.gameField isOutOfFieldAtPosition:p]) {
            if(p.column<0)  result |= TTBlockOutTypeLeft;
            if(p.column>[self.gameField maxColumnIndex])    result |= TTBlockOutTypeRight;
        }
        TetrisUnit *unit = [self.gameField unitAtRow:p.row column:p.column];
        if(unit.exist==YES) {
            result |= TTBlockOutTypeCollide;
        }
    }
    
    return result;
}

#pragma mark - row completion check
- (BOOL)isBoxFullInRow:(int)row {
    

    
    return NO;
}


#pragma mark - control block method
- (void)moveCurrentBlockDown {
    TTPosition *nextPosition = [self.currentBlock.markPosition positionMovedByRowAmount:-1 columnAmount:0];
    if([self block:self.currentBlock canMoveToMarkPosition:nextPosition])
        [self.currentBlock.markPosition moveToPosition:nextPosition];
    else {
        // 블록, 필드에 고정
        NSArray *positions = [self.currentBlock positionsOfBoxes];
        for ( TTPosition *p in positions ) {
            TetrisUnit *unit = [self.gameField unitAtRow:p.row column:p.column];
            unit.exist = YES;
            unit.color = self.currentBlock.blockType;
        }
        
        // 각 줄 꽉 찼는지 검사해서 꽉 찬 줄 제거
        for (int i=0; i<self.gameField.fieldSize.height; i++) {
            if([self.gameField isBoxesFullInRow:i]) {
                [self.gameField clearUnitsInRow:i];
                [self.gameField moveDownRowsAboveRow:i];
            }
        }
        
        // 새 블록 생성
        [self generateNewBlock];
    }
}

- (void)moveCurrentBlockLeft {
    TTPosition *nextPosition = [self.currentBlock.markPosition positionMovedByRowAmount:0 columnAmount:-1];
    if([self block:self.currentBlock canMoveToMarkPosition:nextPosition])
        [self.currentBlock.markPosition moveToPosition:nextPosition];
}
- (void)moveCurrentBlockRight {
    TTPosition *nextPosition = [self.currentBlock.markPosition positionMovedByRowAmount:0 columnAmount:1];
    if([self block:self.currentBlock canMoveToMarkPosition:nextPosition])
        [self.currentBlock.markPosition moveToPosition:nextPosition];
}
- (void)moveCurrentBlockUp {
    TTPosition *nextPosition = [self.currentBlock.markPosition positionMovedByRowAmount:1 columnAmount:0];
    if([self block:self.currentBlock canMoveToMarkPosition:nextPosition])
        [self.currentBlock.markPosition moveToPosition:nextPosition];}

- (void)changeCurrentBlockOrientation {
    NSUInteger oldOrientation = self.currentBlock.blockOrientation;
    NSUInteger newOrientation = (oldOrientation+1)%4;
    self.currentBlock.blockOrientation = newOrientation;
    if(![self block:self.currentBlock canMoveToMarkPosition:self.currentBlock.markPosition]) {
        self.currentBlock.blockOrientation = oldOrientation;
    }

}

- (void)adjustPositionOfBlock {
    
}



#pragma mark - starter
- (void)startNewGame {
    [self.gameField clearGameField];
    self.currentBlock = [TetrisBlock randomBlock];
    self.currentBlock.markPosition = [self.gameField startPositionOfBlock];
}
- (void)generateNewBlock {
    self.currentBlock = [TetrisBlock randomBlock];
    self.currentBlock.markPosition = [self.gameField startPositionOfBlock];
    
    if(![self block:self.currentBlock canMoveToMarkPosition:self.currentBlock.markPosition]) {
        
    }
}





#pragma mark - setter
- (void)configureGame {
    
}

- (UIColor *)colorForBlockType:(TTBlockType)blockType {
    UIColor *color = [self.colorSetting objectForKey:@(blockType)];
    return color;
}

@end
