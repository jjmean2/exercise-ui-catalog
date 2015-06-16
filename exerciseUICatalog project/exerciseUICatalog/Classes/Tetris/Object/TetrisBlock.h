//
//  TetrisBlock.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tetris.h"
#import "TTPosition.h"



@interface TetrisBlock : NSObject

@property (atomic) TTPosition *markPosition;
@property (nonatomic) TTBlockType blockType;
@property (atomic) TTBlockOrientation blockOrientation;

+ (instancetype)randomBlock;
- (instancetype)initWithMarkPosition:(TTPosition *)position blockType:(TTBlockType)blockType;
- (NSArray *)positionsOfBoxesFromMarkPosition:(TTPosition *)markPosition;
- (NSArray *)positionsOfBoxes;
@end
