//
//  UIColor+TintColor.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "UIColor+TintColor.h"

@implementation UIColor (TintColor)

+ (UIColor *)skyblueColor {
    return [self colorWithRed:85.0/255 green:194.0/255 blue:255.0/255 alpha:1.0];
}

+ (UIColor *)wineColor {
    return [self colorWithRed:148.0/255 green:42.0/255 blue:255.0/255 alpha:1.0];
}

+ (UIColor *)lightGreenColor {
    return [self colorWithRed:58.0/255 green:196.0/255 blue:95.0/255 alpha:1.0];
}

+ (UIColor *)darkGreenColor {
    return [self colorWithRed:26.0/255 green:65.0/255 blue:87.0/255 alpha:1.0];
}

@end
