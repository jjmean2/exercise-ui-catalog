//
//  JWLWebViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLWebViewController.h"

@interface JWLWebViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic, weak) IBOutlet UITextField *urlField;

@end

@implementation JWLWebViewController



#pragma mark - 뷰 라이프 사이클

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self loadWebPage];
 /*
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    */
}



- (void)loadWebPage {
    NSString *urlString = self.urlField.text;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


#pragma mark - text field delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if(textField == self.urlField) {
        [self loadWebPage];
    }
    return YES;
}
/*

#pragma mark - action method
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    CGSize keyboardSize = [info[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = self.webView.scrollView.contentInset;
    contentInsets.bottom += keyboardSize.height - 49.0;
    self.webView.scrollView.contentInset = contentInsets;
    
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    CGSize keyboardSize = [info[UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = self.webView.scrollView.contentInset;
    contentInsets.bottom -= keyboardSize.height - 49.0;
    self.webView.scrollView.contentInset = contentInsets;
}
*/

@end
