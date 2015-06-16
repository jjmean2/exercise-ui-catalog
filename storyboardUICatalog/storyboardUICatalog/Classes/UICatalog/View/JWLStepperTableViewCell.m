//
//  JWLStepperTableViewCell.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLStepperTableViewCell.h"

@interface JWLStepperTableViewCell()


@end

@implementation JWLStepperTableViewCell

#pragma mark - 뷰 라이프 사이클

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if(self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _stepper = [[UIStepper alloc] init];
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.textAlignment = NSTextAlignmentRight;
        
        [self.contentView addSubview:_stepper];
        [self.contentView addSubview:_valueLabel];
        
        
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.stepper.center = self.contentView.center;
    
    CGRect subviewFrame = self.contentView.frame;
    subviewFrame.size.width = 40.0;
    subviewFrame.origin.x = self.contentView.frame.size.width - 60.0;
    self.valueLabel.frame = subviewFrame;
}



@end
