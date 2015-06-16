//
//  TTPosition.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 21..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TTPosition : NSObject
@property (atomic) int row;
@property (atomic) int column;

+ (instancetype)positionWithRow:(int)row column:(int)column;
- (instancetype)initWithRow:(int)row column:(int)column;
- (instancetype)positionMovedByRowAmount:(int)rowAmount columnAmount:(int)columnAmount;
- (void)setRow:(int)row column:(int)column;
- (void)moveByRowAmount:(int)rowAmount columnAmount:(int)columnAmount;
- (void)moveToPosition:(TTPosition *)position;
@end
