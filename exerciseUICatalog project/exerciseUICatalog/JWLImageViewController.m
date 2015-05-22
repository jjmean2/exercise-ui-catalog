//
//  JWLImageViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLImageViewController.h"

void CGRectPrint(CGRect, NSString*);

@interface JWLImageViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation JWLImageViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

// 지정 초기화 메소드 재정의
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"Image Views";
    }
    return self;
}


- (void)dealloc {
    NSLog(@"%@ dealloc", self);
}
#pragma mark - 뷰 라이프 사이클

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect imageViewFrame = self.view.bounds;
    
    if(imageViewFrame.size.width>imageViewFrame.size.height) {
        imageViewFrame.size.height -= ( 32.0 + 49.0 );
        imageViewFrame.origin.y += 32.0;
    }
    else {
        imageViewFrame.size.height -= ( 20.0 + 44.0 + 49.0 );
        imageViewFrame.origin.y += 20.0 + 44;
    }
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i=0; i<5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"image_scenery%d.jpg",i+1];
        NSLog(@"%@", imageName);
        if([UIImage imageNamed:imageName])
            [images addObject:[UIImage imageNamed:imageName]];
    }
    
    imageView.animationImages = images;
    
    self.imageView = imageView;
    [self.view addSubview:self.imageView];
    
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.imageView.animationDuration = 1.0 *[self.imageView.animationImages count];
    [self.imageView startAnimating];
    NSLog(@"ssr%@", self.imageView);
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.imageView stopAnimating];
}

// rotate시 subviews 재배치
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    CGRect newFrame = self.view.frame;
    newFrame.size = size;
    if(size.width>size.height) {
        newFrame.size.height -= 32.0 + 49.0;
        newFrame.origin.y += 32.0;
    }
    else {
        newFrame.size.height -= 20.0 + 44.0 + 49.0;
        newFrame.origin.y += 20.0 + 44.0;
    }
    self.imageView.frame = newFrame;
    

    

}
@end
