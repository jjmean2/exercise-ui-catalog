//
//  JWLCustomTextField.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLCustomTextField.h"

void CGRectPrint(CGRect, NSString *);


@implementation JWLCustomTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
    }
    return self;
}


- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect textRect;
    if(self.background == nil) {
        textRect = [super textRectForBounds:bounds];
    } else {
        textRect = CGRectInset(bounds, 8.0, 0.0);
    }
    
    return textRect;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect editingRect;
    if(self.background == nil) {
        editingRect = [super editingRectForBounds:bounds];
    }
    else {
        editingRect = CGRectInset(bounds, 8.0, 0.0);
    }
    return editingRect;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds {
    CGRectPrint(bounds, @"rightView bounds");
    CGRectPrint([super rightViewRectForBounds:bounds], @"super rightView bounds");
    CGRect rightViewRect = [super rightViewRectForBounds:bounds];
    rightViewRect.origin.x -= 4.0;
    return rightViewRect;
}


@end
