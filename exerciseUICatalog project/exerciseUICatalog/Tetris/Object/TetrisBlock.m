//
//  TetrisBlock.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "TetrisBlock.h"



extern TTSize TTSizeMake(int width, int height);
extern TTUnitBox TTUnitBoxMake(TTBlockColor color);


@implementation TetrisBlock
+ (instancetype)randomBlock {
    // 랜덤 블록 생성
    TTPosition *position = [TTPosition positionWithRow:0 column:0];
    TTBlockType types[] = { TTBlockTypeIShape, TTBlockTypeJShape, TTBlockTypeLShape, TTBlockTypeOShape, TTBlockTypeSShape, TTBlockTypeTShape, TTBlockTypeZShape };
    int randomIndex = arc4random()%7;
    TTBlockType type = types[randomIndex];
    
    TetrisBlock *block = [[self alloc] initWithMarkPosition:position blockType:type];
    return block;
}

- (instancetype)init {
    return [self initWithMarkPosition:[TTPosition positionWithRow:0 column:0] blockType:TTBlockTypeIShape];
}

- (instancetype)initWithMarkPosition:(TTPosition *)position blockType:(TTBlockType)blockType {
    self = [super init];
    if(self) {
        _markPosition = position;
        _blockType = blockType;
        _blockOrientation = TTBlockOrientationUp;
    }
    return self;
}

- (NSArray *)positionsOfBoxes {
    return [self positionsOfBoxesFromMarkPosition:self.markPosition];
}

- (NSArray *)positionsOfBoxesFromMarkPosition:(TTPosition *)markPosition {
    NSArray *positions = nil;
    TTPosition *p1;
    TTPosition *p2;
    TTPosition *p3;
    TTPosition *p4;
    
    // 이 블록의 박스 위치들(4개) 반환
    if(self.blockType == TTBlockTypeIShape) {
        switch (self.blockOrientation) {
            case TTBlockOrientationUp:
            case TTBlockOrientationDown:
                p1 = [markPosition positionMovedByRowAmount:-2 columnAmount:-1];
                p2 = [p1 positionMovedByRowAmount:0 columnAmount:1];
                p3 = [p2 positionMovedByRowAmount:0 columnAmount:1];
                p4 = [p3 positionMovedByRowAmount:0 columnAmount:1];
                break;
            case TTBlockOrientationRight:
            case TTBlockOrientationLeft:
                p1 = [markPosition positionMovedByRowAmount:0 columnAmount:0];
                p2 = [p1 positionMovedByRowAmount:-1 columnAmount:0];
                p3 = [p2 positionMovedByRowAmount:-1 columnAmount:0];
                p4 = [p3 positionMovedByRowAmount:-1 columnAmount:0];
                break;
            default:
                break;
        }
    }
    
    else if(self.blockType == TTBlockTypeJShape) {
        switch (self.blockOrientation) {
            case TTBlockOrientationUp:
                p1 = [markPosition positionMovedByRowAmount:0 columnAmount:-1];
                p2 = [p1 positionMovedByRowAmount:-1 columnAmount:0];
                p3 = [p2 positionMovedByRowAmount:0 columnAmount:1];
                p4 = [p3 positionMovedByRowAmount:0 columnAmount:1];
                break;
                
            case TTBlockOrientationRight:
                p1 = [markPosition positionMovedByRowAmount:0 columnAmount:1];
                p2 = [p1 positionMovedByRowAmount:0 columnAmount:-1];
                p3 = [p2 positionMovedByRowAmount:-1 columnAmount:0];
                p4 = [p3 positionMovedByRowAmount:-1 columnAmount:0];
                break;
            case TTBlockOrientationDown:
                p1 = [markPosition positionMovedByRowAmount:-2 columnAmount:1];
                p2 = [p1 positionMovedByRowAmount:1 columnAmount:0];
                p3 = [p2 positionMovedByRowAmount:0 columnAmount:-1];
                p4 = [p3 positionMovedByRowAmount:0 columnAmount:-1];
                break;
                
            case TTBlockOrientationLeft:
                p1 = [markPosition positionMovedByRowAmount:-2 columnAmount:-1];
                p2 = [p1 positionMovedByRowAmount:0 columnAmount:1];
                p3 = [p2 positionMovedByRowAmount:1 columnAmount:0];
                p4 = [p3 positionMovedByRowAmount:1 columnAmount:0];
                break;
            default:
                break;
        }
    }
    
    else if(self.blockType == TTBlockTypeLShape) {
        switch (self.blockOrientation) {
            case TTBlockOrientationUp:
                p1 = [markPosition positionMovedByRowAmount:0 columnAmount:1];
                p2 = [p1 positionMovedByRowAmount:-1 columnAmount:0];
                p3 = [p2 positionMovedByRowAmount:0 columnAmount:-1];
                p4 = [p3 positionMovedByRowAmount:0 columnAmount:-1];
                break;
            case TTBlockOrientationRight:
                p1 = [markPosition positionMovedByRowAmount:-2 columnAmount:1];
                p2 = [p1 positionMovedByRowAmount:0 columnAmount:-1];
                p3 = [p2 positionMovedByRowAmount:1 columnAmount:0];
                p4 = [p3 positionMovedByRowAmount:1 columnAmount:0];
                break;
            case TTBlockOrientationDown:
                p1 = [markPosition positionMovedByRowAmount:-2 columnAmount:-1];
                p2 = [p1 positionMovedByRowAmount:1 columnAmount:0];
                p3 = [p2 positionMovedByRowAmount:0 columnAmount:1];
                p4 = [p3 positionMovedByRowAmount:0 columnAmount:1];
                break;
            case TTBlockOrientationLeft:
                p1 = [markPosition positionMovedByRowAmount:0 columnAmount:-1];
                p2 = [p1 positionMovedByRowAmount:0 columnAmount:1];
                p3 = [p2 positionMovedByRowAmount:-1 columnAmount:0];
                p4 = [p3 positionMovedByRowAmount:-1 columnAmount:0];
                break;
            default:
                break;
        }
    }
    
    else if(self.blockType == TTBlockTypeOShape) {
        p1 = [markPosition positionMovedByRowAmount:0 columnAmount:0];
        p2 = [p1 positionMovedByRowAmount:-1 columnAmount:0];
        p3 = [p2 positionMovedByRowAmount:0 columnAmount:-1];
        p4 = [p3 positionMovedByRowAmount:1 columnAmount:0];
    }
    
    else if(self.blockType == TTBlockTypeTShape) {
        switch (self.blockOrientation) {
            case TTBlockOrientationUp:
                p1 = [markPosition positionMovedByRowAmount:0 columnAmount:0];
                p2 = [p1 positionMovedByRowAmount:-1 columnAmount:-1];
                p3 = [p2 positionMovedByRowAmount:0 columnAmount:1];
                p4 = [p3 positionMovedByRowAmount:0 columnAmount:1];
                break;
            case TTBlockOrientationRight:
                p1 = [markPosition positionMovedByRowAmount:-1 columnAmount:1];
                p2 = [p1 positionMovedByRowAmount:1 columnAmount:-1];
                p3 = [p2 positionMovedByRowAmount:-1 columnAmount:0];
                p4 = [p3 positionMovedByRowAmount:-1 columnAmount:0];
                break;
            case TTBlockOrientationDown:
                p1 = [markPosition positionMovedByRowAmount:-2 columnAmount:0];
                p2 = [p1 positionMovedByRowAmount:1 columnAmount:1];
                p3 = [p2 positionMovedByRowAmount:0 columnAmount:-1];
                p4 = [p3 positionMovedByRowAmount:0 columnAmount:-1];
                break;
            case TTBlockOrientationLeft:
                p1 = [markPosition positionMovedByRowAmount:-1 columnAmount:-1];
                p2 = [p1 positionMovedByRowAmount:-1 columnAmount:1];
                p3 = [p2 positionMovedByRowAmount:1 columnAmount:0];
                p4 = [p3 positionMovedByRowAmount:1 columnAmount:0];
                break;
                
            default:
                break;
        }
    }
    
    else if(self.blockType == TTBlockTypeSShape) {
        switch (self.blockOrientation) {
            case TTBlockOrientationUp:
            case TTBlockOrientationDown:
                p1 = [markPosition positionMovedByRowAmount:0 columnAmount:1];
                p2 = [p1 positionMovedByRowAmount:0 columnAmount:-1];
                p3 = [p2 positionMovedByRowAmount:-1 columnAmount:0];
                p4 = [p3 positionMovedByRowAmount:0 columnAmount:-1];
                break;
            case TTBlockOrientationRight:
            case TTBlockOrientationLeft:
                p1 = [markPosition positionMovedByRowAmount:0 columnAmount:-1];
                p2 = [p1 positionMovedByRowAmount:-1 columnAmount:0];
                p3 = [p2 positionMovedByRowAmount:0 columnAmount:1];
                p4 = [p3 positionMovedByRowAmount:-1 columnAmount:0];
                break;
            default:
                break;
        }
    }
    
    else if(self.blockType == TTBlockTypeZShape) {
        switch (self.blockOrientation) {
            case TTBlockOrientationUp:
            case TTBlockOrientationDown:
                p1 = [markPosition positionMovedByRowAmount:0 columnAmount:-1];
                p2 = [p1 positionMovedByRowAmount:0 columnAmount:1];
                p3 = [p2 positionMovedByRowAmount:-1 columnAmount:0];
                p4 = [p3 positionMovedByRowAmount:0 columnAmount:1];
                break;
            case TTBlockOrientationRight:
            case TTBlockOrientationLeft:
                p1 = [markPosition positionMovedByRowAmount:0 columnAmount:1];
                p2 = [p1 positionMovedByRowAmount:-1 columnAmount:0];
                p3 = [p2 positionMovedByRowAmount:0 columnAmount:-1];
                p4 = [p3 positionMovedByRowAmount:-1 columnAmount:0];
                break;
            default:
                break;
        }
    }
    
    positions = @[p1, p2, p3, p4];
    return positions;
}
/*
- (NSArray *)positionsOfBoxesForNextBlockFrame {
    
}
 */
@end
