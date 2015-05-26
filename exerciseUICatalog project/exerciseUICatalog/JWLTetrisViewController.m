//
//  JWLTetrisViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 7..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLTetrisViewController.h"


void CGRectPrint(CGRect rect, NSString *name);

TTSize TTSizeMake(int width, int height) {
    TTSize size;
    size.width = width;
    size.height = height;
    return size;
}
TTUnitBox TTUnitBoxMake(TTBlockColor color) {
    TTUnitBox box;
    box.color = color;
    return box;
}


@interface JWLTetrisViewController()

@property (nonatomic, weak) JWLTetrisView *tetrisView;
@property (nonatomic, strong) TetrisGameManager *gameManager;
@end

@implementation JWLTetrisViewController

#pragma mark - 뷰컨트롤러 라이프 사이클
// 지정초기화 메소드 재정의
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.tabBarItem.title = @"Tetris";
    }

    return self;
}


#pragma mark - 뷰 라이프 사이클
- (void)loadView {
    JWLTetrisView *backgroundView = [[JWLTetrisView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = backgroundView;
    self.tetrisView = backgroundView;
    self.gameManager = backgroundView.gameManager;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    JWLButtonWithTimer *button;
    // left button
    button = [[JWLButtonWithTimer alloc] init];
    CGRect frame;
    frame.size = CGSizeMake(40, 40);
    frame.origin = CGPointMake(10, self.view.frame.size.height - (49.0 +frame.size.height));
    button.frame = frame;
    button.backgroundColor = [UIColor skyblueColor];
    button.moveDirection = TTButtonMoveDirectionLeft;
    [button addTarget:self action:@selector(moveStart:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(moveStop:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(moveStop:) forControlEvents:UIControlEventTouchDragExit];
    [self.view addSubview:button];
    
    // right button
    button = [[JWLButtonWithTimer alloc] init];
    frame.origin.x = self.view.frame.size.width - 10 - frame.size.width;
    button.frame = frame;
    button.backgroundColor = [UIColor skyblueColor];
    button.moveDirection = TTButtonMoveDirectionRight;
    [button addTarget:self action:@selector(moveStart:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(moveStop:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(moveStop:) forControlEvents:UIControlEventTouchDragExit];
    [self.view addSubview:button];
    
    // down button
    button = [[JWLButtonWithTimer alloc] init];
    frame.origin.x = (self.view.frame.size.width - frame.size.width)/2.0;
    button.frame = frame;
    button.backgroundColor = [UIColor skyblueColor];
    button.moveDirection = TTButtonMoveDirectionDown;
    [button addTarget:self action:@selector(moveStart:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(moveStop:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(moveStop:) forControlEvents:UIControlEventTouchDragExit];
    [self.view addSubview:button];
    
    // change orientation button
    UIButton *orientationButton = [[UIButton alloc] init];
    frame.origin.x += frame.size.width + 20.0;
    orientationButton.frame = frame;
    orientationButton.backgroundColor = [UIColor cyanColor];
    [orientationButton addTarget:self action:@selector(changeBlockOrientation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:orientationButton];
    
    
    // restart button
    UIButton *restartButton = [[UIButton alloc] init];
    frame.size = CGSizeMake(80, 40);
    frame.origin.y = 40.0;
    frame.origin.x = self.view.frame.size.width - 10 - frame.size.width;
    restartButton.frame = frame;
    restartButton.backgroundColor = [UIColor redColor];
    restartButton.tintColor = [UIColor yellowColor];
    restartButton.titleLabel.text = @"재시작";
    [restartButton addTarget:self action:@selector(startNewGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:restartButton];
    [self startNewGame];
    [self.view setNeedsDisplay];
    
}
- (void)viewWillAppear:(BOOL)animated {

}

- (void)viewDidDisappear:(BOOL)animated {
    
}

#pragma mark - target action method
- (void)moveLeft {
    [self.gameManager moveCurrentBlockLeft];
    [self.view setNeedsDisplay];
}
- (void)moveRight {
    [self.gameManager moveCurrentBlockRight];
    [self.view setNeedsDisplay];
}
- (void)moveDown {
    [self.gameManager moveCurrentBlockDown];
    [self.view setNeedsDisplay];
}
- (void)moveUp {
    [self.gameManager moveCurrentBlockUp];
    [self.view setNeedsDisplay];
}

- (void)moveStart:(JWLButtonWithTimer *)sender {
    TTButtonMoveDirection direction = sender.moveDirection;
    if(direction == TTButtonMoveDirectionDown) {
        sender.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveDown) userInfo:nil repeats:YES];
    }
    else if(direction == TTButtonMoveDirectionLeft) {
        sender.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveLeft) userInfo:nil repeats:YES];
    }
    else if(direction == TTButtonMoveDirectionRight) {
        sender.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveRight) userInfo:nil repeats:YES];
    }
    else if(direction == TTButtonMoveDirectionUp) {
        sender.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveUp) userInfo:nil repeats:YES];
    }
    
}

- (void)changeBlockOrientation:(UIButton *)sender {
    [self.gameManager changeCurrentBlockOrientation];
    [self.view setNeedsDisplay];
}


- (void)moveStop:(JWLButtonWithTimer *)sender {
    if(sender.timer !=nil)
        [sender.timer invalidate];
    sender.timer = nil;
}


- (void)startDropBlock {
    @autoreleasepool {
        NSLog(@"runloop");
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(keepDropping) userInfo:nil repeats:YES];
//        [runLoop addTimer:self.progressTimer forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }
}

- (void)keepDropping {
    [self.gameManager performSelectorOnMainThread:@selector(moveCurrentBlockDown) withObject:nil waitUntilDone:YES];
//    [self.gameManager moveCurrentBlockDown];

    
    [self.view performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:NO];
//    [self.view setNeedsDisplay];
    
}

- (void)startNewGame {
    if(self.progressTimer!=nil) {
        [self.progressTimer invalidate];
    }
    [NSThread detachNewThreadSelector:@selector(startDropBlock) toTarget:self withObject:nil];

    [self.tetrisView.gameManager startNewGame];
    [self.view setNeedsDisplay];
}

#pragma mark - 회전방향지원
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
