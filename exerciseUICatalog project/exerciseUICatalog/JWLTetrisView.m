//
//  JWLTetrisView.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 7..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLTetrisView.h"
#import "UIColor+TintColor.h"


void CGRectPrint(CGRect rect, NSString *name);
extern TTSize TTSizeMake(int width, int height);


@interface JWLTetrisView()



@end



@implementation JWLTetrisView

#pragma mark - view init method

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        _gameManager = [[TetrisGameManager alloc] initWithGameFieldSize:TTSizeMake(10, 20)];
        
    }
    
    return self;
}

#pragma mark - property accessor
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    CGRect visibleFrame = frame;
    visibleFrame.size.height -= 20.0 + 49.0;
    visibleFrame.origin.y += 20.0;
    self.visibleFrame = visibleFrame;
    
    visibleFrame.size.width = (int)(visibleFrame.size.width*0.7);
    visibleFrame.size.height = (int)(visibleFrame.size.height*0.9);
    [self.gameManager setFieldFrameInBounds:visibleFrame];
}

#pragma mark - draw method
- (void)drawRect:(CGRect)rect {
 //   [self drawRectangle:self.visibleFrame withColor:[UIColor yellowColor]];
    [self drawGameField];
    [self drawFieldBoxes];
    [self drawCurrentBlock];

}



#pragma mark - custom method



#pragma mark - draw method
- (void)drawGameField {
    CGRect rect = self.gameManager.fieldFrame;
    rect = CGRectInset(rect, -5, -5);
    [self drawRectangle:rect withColor:[UIColor darkGrayColor]];
    [self drawStroke:rect withColor:[UIColor whiteColor] lineWidth:10.0];
}

- (void)drawFieldBoxes {
    TetrisGameField *field = self.gameManager.gameField;
    for (NSArray *array in field.coordinates) {
        for(TetrisUnit *unit in array) {
            if(unit.exist) {
                CGRect rect = [self.gameManager CGRectForBoxAtPosition:unit.postion];
                UIColor *color;
                color = [self.gameManager colorForBlockType:unit.color];
                [self drawRectangle:rect withColor:color];
            }
        }
    }
}

- (void)drawCurrentBlock {
    TetrisBlock *block = self.gameManager.currentBlock;
    if(block) {
        NSArray *positions = [block positionsOfBoxesFromMarkPosition:block.markPosition];
        for (TTPosition *p in positions) {
            CGRect rect = [self.gameManager CGRectForBoxAtPosition:p];
            UIColor *color = [self.gameManager colorForBlockType:block.blockType];
            [self drawRectangle:rect withColor:color];
        }
    }
}



- (void)drawRectangle:(CGRect)rect withColor:(UIColor *)color {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat red=0.0, green=0.0, blue=0.0, alpha=1.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    CGContextSetRGBFillColor(context, red, green, blue, alpha);
    CGContextFillRect(context, rect);

}

- (void)drawStroke:(CGRect)rect withColor:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat red=0.0, green=0.0, blue=0.0, alpha=1.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    CGContextSetRGBStrokeColor(context, red, green, blue, alpha);
    CGContextSetLineWidth(context, lineWidth);
    CGContextStrokeRect(context, rect);
}

/*
- (void)drawGameField {
    CGRect rectangle = self.gameManager.fieldFrame;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0, 0, 0, 1);
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    CGContextFillRect(context, rectangle);
}
*/


- (void)drawBox:(CGRect)boxFrame {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextFillRect(context, boxFrame);
}








- (void)drawUIGraphic:(CGRect)rect {
    
    CGRect rectangle = CGRectMake(0, 100, 320, 100);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0, 0, 0, 0.5);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 0.5);
    CGContextFillRect(context, rectangle);
}

- (void)drawCGGraphic:(CGRect)rect {
   
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(30, 30)];
    [path addLineToPoint:CGPointMake(100, 30)];
    [path addLineToPoint:CGPointMake(100, 80)];
    [path addLineToPoint:CGPointMake(10, 60)];
    [path fill];
}


@end
