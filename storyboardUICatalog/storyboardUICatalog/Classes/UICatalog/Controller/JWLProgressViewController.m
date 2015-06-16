//
//  JWLProgressViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 15..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLProgressViewController.h"

@interface JWLProgressViewController ()

@property (nonatomic, weak) IBOutlet UIProgressView *defaultProgressView;
@property (nonatomic, weak) IBOutlet UIProgressView *barProgressView;
@property (nonatomic, weak) IBOutlet UIProgressView *tintedProgressView;

@end

@implementation JWLProgressViewController
{
    int _work;
}

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.defaultProgressView.progress = 0.0;
    _work = 100;

    [self startProgressTest];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}


- (void)startProgressTest {
    dispatch_queue_t queue;
    queue = dispatch_queue_create("work", NULL);
    NSLog(@"_work[%p], %d", &_work, _work);
        dispatch_async(queue, ^{
            while(_work>0) {
                _work -= arc4random()%20 +1;

                if(_work<0) _work=0;
                float progress = (100-_work)/100.0;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.defaultProgressView setProgress:progress animated:YES];
                    [self.barProgressView setProgress:progress animated:YES];
                    [self.tintedProgressView setProgress:progress animated:YES];
                    NSLog(@"%@, set progress in main Q [progress=%f]", self, progress);
                });
                usleep(800*1000);
            }
            NSLog(@"%@, 끝", self);
        });
    NSLog(@"%@, progressTest end", self);

}

- (void)dealloc {
    NSLog(@"%@, deallocated view controller progress", self);

}

- (NSString *)description {
    NSString *string = [NSString stringWithFormat:@"pvc[%p]", self];
    return string;
}

@end
