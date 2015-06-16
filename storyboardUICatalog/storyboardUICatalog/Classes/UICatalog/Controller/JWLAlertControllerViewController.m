//
//  JWLAlertControllerViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 8..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLAlertControllerViewController.h"

@implementation JWLAlertControllerViewController


#pragma mark - table view delegate method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    NSString *alertTitle = @"A Short Title is Best";
    NSString *alertMessage = @"A message should be a short, complete sentence.";
    
    UIAlertController *alertController = nil;
    UIAlertAction *action = nil;
    
    if(section == 0) {
        alertController
        = [UIAlertController alertControllerWithTitle:alertTitle
                                              message:alertMessage
                                       preferredStyle:UIAlertControllerStyleAlert];
        
        if(row == 0) {
            action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:action];
        }
        else if(row == 1) {
            action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:action];
            action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:action];
        }
        else if(row == 2) {
            action = [UIAlertAction actionWithTitle:@"Choice One" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:action];
            action = [UIAlertAction actionWithTitle:@"Choice Two" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:action];
            action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:action];
        }
        else if(row == 3) {
            [alertController addTextFieldWithConfigurationHandler:nil];
            action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:action];
            action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:action];
        }
        else if(row == 4) {
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.secureTextEntry = YES;
            }];
            action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:action];
            action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:action];
        }

    }
    
    else if(section == 1) {
        alertController
        = [UIAlertController alertControllerWithTitle:nil
                                              message:nil
                                       preferredStyle:UIAlertControllerStyleActionSheet];
        if(row == 0) {
            action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
            [alertController addAction:action];
            action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:action];
        }
        else if(row == 1) {
            action = [UIAlertAction actionWithTitle:@"Destructive Choice" style:UIAlertActionStyleDestructive handler:nil];
            [alertController addAction:action];
            action = [UIAlertAction actionWithTitle:@"Safe Choice" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:action];

        }
    }
    
    if(alertController) {
        [self presentViewController:alertController animated:YES completion:nil];
    }

}

@end
