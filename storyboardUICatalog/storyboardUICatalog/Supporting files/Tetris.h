//
//  Tetris.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTPosition.h"

#ifndef exerciseUICatalog_Tetris_h
#define exerciseUICatalog_Tetris_h

#pragma mark - enum constants
typedef NS_ENUM(NSUInteger, TTBlockColor) {
    TTBlockColorNone = 0,
    TTBlockColorForIShape = 1,
    TTBlockColorForJShape,
    TTBlockColorForLShape,
    TTBlockColorForOShape,
    TTBlockColorForTShape,
    TTBlockColorForSShape,
    TTBlockColorForZShape
};


typedef NS_ENUM(NSUInteger, TTBlockType) {
    TTBlockTypeIShape=1,
    TTBlockTypeJShape,
    TTBlockTypeLShape,
    TTBlockTypeOShape,
    TTBlockTypeSShape,
    TTBlockTypeTShape,
    TTBlockTypeZShape,
    TTBlockTypeNone
};

typedef NS_ENUM(NSUInteger, TTBlockOrientation) {
    TTBlockOrientationUp = 0,
    TTBlockOrientationRight = 1,
    TTBlockOrientationDown = 2,
    TTBlockOrientationLeft = 3
};

typedef NS_ENUM(NSUInteger, TTButtonMoveDirection) {
    TTButtonMoveDirectionLeft = 1,
    TTButtonMoveDirectionRight,
    TTButtonMoveDirectionDown,
    TTButtonMoveDirectionUp
};

typedef NS_OPTIONS(NSUInteger, TTBlockOutType) {
    TTBlockOutTypeNone = 0,
    TTBlockOutTypeMaskLeft = 1,
    TTBlockOutTypeLeft = 1,
    TTBlockOutTypeMaskRight = 1 << 1,
    TTBlockOutTypeRight = 1 << 1,
    TTBlockOutTypeMaskCollide = 1 << 2,
    TTBlockOutTypeCollide = 1 << 2
};

#pragma mark - struct types

struct TTUnitBox {
    TTBlockColor color;
};

struct TTSize {
    int width;
    int height;
};

typedef struct TTUnitBox TTUnitBox;
typedef struct TTSize TTSize;

#pragma mark - constants


#endif
