//
//  JWLProgressViewTableViewCell.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 15..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLProgressViewTableViewCell.h"

@interface JWLProgressViewTableViewCell()

@end

@implementation JWLProgressViewTableViewCell

#pragma mark - 뷰 라이프 사이클

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if(self) {
        _progressView = [[UIProgressView alloc] init];
        _progressView.progress = 0.0;
        [self.contentView addSubview:_progressView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    CGRect subviewFrame = self.progressView.frame;
    subviewFrame.size.width = self.contentView.frame.size.width - 40.0;
    self.progressView.frame = subviewFrame;
    

    
    
    self.progressView.center = self.contentView.center;
    
}

@end
