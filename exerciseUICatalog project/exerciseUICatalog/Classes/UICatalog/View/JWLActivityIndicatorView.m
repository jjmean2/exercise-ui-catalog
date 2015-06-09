//
//  JWLActivityIndicatorView.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 8..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLActivityIndicatorView.h"

@implementation JWLActivityIndicatorView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)dealloc {
    static int i=0;
    NSLog(@"%@, dealloc, %d", NSStringFromClass([self class]), i++);
}
@end
