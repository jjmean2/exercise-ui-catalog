//
//  JWLTabBarController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 16..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLTabBarController.h"

@interface JWLTabBarController ()

@end

@implementation JWLTabBarController

- (NSUInteger)supportedInterfaceOrientations {
    NSLog(@"tabBar supportedInterfaceOrientations, %@", self.selectedViewController);
    return [self.selectedViewController supportedInterfaceOrientations];
}


@end
