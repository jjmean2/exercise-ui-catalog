//
//  TetrisMap.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "TetrisUnit.h"

extern TTSize TTSizeMake(int width, int height);
extern TTUnitBox TTUnitBoxMake(TTBlockColor color);


@implementation TetrisUnit
- (instancetype)init {
    return [self initWithPosition:[TTPosition positionWithRow:0 column:0]];
}

- (instancetype)initWithPosition:(TTPosition *)position {
    self = [super init];
    if(self) {
        _exist = NO;
        _color = TTBlockTypeNone;
        _postion = position;
    }
    return self;
}

- (void)copyToUnit:(TetrisUnit *)unitTo {
    unitTo.exist = self.exist;
    unitTo.color = self.color;
}


- (NSString *)description {
    NSString *exist = self.exist==YES ? @"YES" : @" NO";

    return [NSString stringWithFormat:@"(%@)",exist];
}
@end
