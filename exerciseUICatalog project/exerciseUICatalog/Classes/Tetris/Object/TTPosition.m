//
//  TTPosition.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "TTPosition.h"



@implementation TTPosition

#pragma mark - class method
+ (instancetype)positionWithRow:(int)row column:(int)column {
    TTPosition *p = [[self alloc] initWithRow:row column:column];
    return p;
}

#pragma mark - init method
- (instancetype)init {
    return [self initWithRow:0 column:0];
}

- (instancetype)initWithRow:(int)row column:(int)column {
    self = [super init];
    if(self) {
        _row = row;
        _column = column;
    }
    return self;
}

#pragma mark - convenience method
- (instancetype)positionMovedByRowAmount:(int)rowAmount columnAmount:(int)columnAmount {
    TTPosition *p = [[[self class] alloc] initWithRow:self.row + rowAmount column:self.column + columnAmount];
    return p;
}

#pragma mark - property modify method
- (void)setRow:(int)row column:(int)column {
    self.row = row;
    self.column = column;
}

- (void)moveByRowAmount:(int)rowAmount columnAmount:(int)columnAmount {
    self.row += rowAmount;
    self.column += columnAmount;
}

- (void)moveToPosition:(TTPosition *)position {
    self.row = position.row;
    self.column = position.column;
}

@end
