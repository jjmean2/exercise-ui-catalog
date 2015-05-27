//
//  JWLButtonTableViewCell.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWLButtonTableViewCell : UITableViewCell
@property (nonatomic, strong, readonly) UIButton *button;

- (void)addButtonWithType:(UIButtonType)buttonType;
- (void)removeButton;

@end
