//
//  JWLButtonTableViewCell.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLButtonTableViewCell.h"

@implementation JWLButtonTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if(self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)addButtonWithType:(UIButtonType)buttonType {
    NSLog(@"addButtonWithType");
    _button = [UIButton buttonWithType:buttonType];
    [self addSubview:self.button];
    
}

- (void)removeButton {
    NSLog(@"removeButton");
    [self.button removeFromSuperview];
    _button = nil;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if(self.button) {
        CGPoint center = self.contentView.center;
        self.button.center = center;
    }
}




@end
