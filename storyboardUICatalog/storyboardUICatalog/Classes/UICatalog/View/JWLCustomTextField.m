//
//  JWLCustomTextField.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLCustomTextField.h"

void CGRectPrint(CGRect, NSString *);


@implementation JWLCustomTextField

- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect textRect = [super textRectForBounds:bounds];
    return CGRectInset(textRect, 8.0, 0.0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds {
    CGRect rightViewRect = [super rightViewRectForBounds:bounds];
    rightViewRect.origin.x -= 8.0;
    return rightViewRect;
}


@end
