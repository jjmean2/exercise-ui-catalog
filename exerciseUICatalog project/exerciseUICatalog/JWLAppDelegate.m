//
//  JWLAppDelegate.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 7..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLAppDelegate.h"

#import "JWLTabBarController.h"
#import "JWLNavigationController.h"
#import "JWLUICatalogListViewController.h"
#import "JWLTetrisViewController.h"

void CGRectPrint(CGRect rect, NSString *name) {
    NSLog(@"%@ is (%d, %d, %d, %d)", name, (int)rect.origin.x, (int)rect.origin.y, (int)rect.size.width, (int)rect.size.height);
}


@interface JWLAppDelegate()

@end

@implementation JWLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"== %@, %@ start =======================", self, NSStringFromSelector(_cmd));
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // 기본 뷰 컨트롤러 생성
    // 윈도우 -> 탭바 -> ( (네비게이션 -> 카탈로그리스트), 테트리스 )
    JWLTabBarController *tabBarController = [[JWLTabBarController alloc] init];
 
    JWLUICatalogListViewController *listViewController = [[JWLUICatalogListViewController alloc] init];
    JWLNavigationController *navigationController = [[JWLNavigationController alloc] initWithRootViewController:listViewController];
    navigationController.tabBarItem.title = @"UICatalog";
    
    JWLTetrisViewController *tetrisViewController = [[JWLTetrisViewController alloc] init];
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:navigationController, tetrisViewController, nil];
    
    self.window.rootViewController = tabBarController;
    
    // 윈도우 배경색 설정, 표시
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSLog(@"%@", self.window);

    CGRectPrint(application.statusBarFrame, @"statusBar");

    
    NSLog(@"== %@, %@ end =======================", self, NSStringFromSelector(_cmd));

    return YES;
}





@end
