//
//  TetrisMap.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tetris.h"
#import "TTPosition.h"

@interface TetrisUnit : NSObject

@property (atomic) BOOL exist;
@property (atomic) TTBlockType color;
@property (nonatomic, readonly) TTPosition *postion;

- (instancetype)initWithPosition:(TTPosition *)position;
- (void)copyToUnit:(TetrisUnit *)unitTo;

@end
