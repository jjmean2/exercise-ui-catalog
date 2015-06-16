//
//  JWLPickerViewInfo.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 15..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLPickerViewInfoView.h"

void CGRectPrint(CGRect, NSString*);

@interface JWLPickerViewInfoView()

@end


@implementation JWLPickerViewInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _colorPicker = [[UIPickerView alloc] init];

        NSLog(@"%@", _colorPicker);
        _colorView = [[UIView alloc] init];
        NSLog(@"%@", _colorView);
        
        
        [self addSubview:_colorPicker];
        [self addSubview:_colorView];
        
    }
    return self;
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    // status bar, navigation bar, tab bar 크기 계산
    UITabBarController *tbc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *nc = tbc.viewControllers[0];
    
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat tabBarHeight = tbc.tabBar.frame.size.height;
    CGFloat navigationBarHeight = nc.navigationBar.frame.size.height;
    
    NSLog(@"%f, %f, %f", statusBarHeight, navigationBarHeight, tabBarHeight);

    // status bar, navigation bar, tab bar 제외한 frame 계산
    CGRect innerFrame = frame;
    innerFrame.size.height -= statusBarHeight + navigationBarHeight + tabBarHeight;
    innerFrame.origin.y += statusBarHeight + navigationBarHeight;
    
    // picker view frame 계산
    CGRect subviewFrame = self.colorPicker.frame;
    
    subviewFrame.size.width = innerFrame.size.width;
    subviewFrame.size.height = 162;
    subviewFrame.origin.x = 0.0;
    subviewFrame.origin.y = innerFrame.origin.y;
    self.colorPicker.frame = subviewFrame;
    
    
    // color view frame 계산
    innerFrame.size.height -= subviewFrame.size.height;
    innerFrame.origin.y += subviewFrame.size.height;
    subviewFrame = CGRectInset(innerFrame, 15.0, 15.0);
    self.colorView.frame = subviewFrame;
    
    
}

@end
