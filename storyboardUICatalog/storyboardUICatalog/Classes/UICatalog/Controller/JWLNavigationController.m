//
//  JWLNavigationController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 16..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLNavigationController.h"

@interface JWLNavigationController ()

@end

@implementation JWLNavigationController


- (NSUInteger)supportedInterfaceOrientations {
    NSLog(@"supportedInterfaceOrientations, navi, %@", self.topViewController);
    return [self.topViewController supportedInterfaceOrientations];
}




@end
