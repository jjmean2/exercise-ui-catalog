//
//  JWLImageViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLImageViewController.h"

void CGRectPrint(CGRect, NSString*);

@interface JWLImageViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation JWLImageViewController


#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for(int i=0; i<5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"image_scenery%d.jpg", i+1]];
        [images addObject:image];
    }
    self.imageView.animationImages = images;
    self.imageView.image = images[0];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.imageView.animationDuration = 1.0 *[self.imageView.animationImages count];
    [self.imageView startAnimating];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.imageView stopAnimating];
}


 

@end
