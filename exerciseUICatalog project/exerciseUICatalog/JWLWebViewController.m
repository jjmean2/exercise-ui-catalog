//
//  JWLWebViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLWebViewController.h"

@interface JWLWebViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation JWLWebViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"Web View";
    }
    return self;
}

#pragma mark - 뷰 라이프 사이클

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *textField = [[UITextField alloc] init];
    UIWebView *webView = [[UIWebView alloc] init];
    
    //frame 설정
    CGRect visibleFrame = self.view.frame;
    visibleFrame.size.height -= 20.0 + 44.0 + 49.0;
    visibleFrame.origin.y += 20.0 + 44.0;
    
    CGRect frame = visibleFrame;
    frame.size.height = 30.0;
    frame.size.width -= 20.0;
    frame.origin.x = frame.origin.x + (visibleFrame.size.width - frame.size.width) /2.0;
    frame.origin.y = frame.origin.y + (40.0 - frame.size.height) /2.0;
    textField.frame = frame;
    
    visibleFrame.size.height -= 40.0;
    visibleFrame.origin.y += 40.0;
    webView.frame = visibleFrame;
    
    textField.borderStyle = UITextBorderStyleLine;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.keyboardType = UIKeyboardTypeURL;
    textField.returnKeyType = UIReturnKeyGo;
    textField.text = @"http://apple.com";
    textField.delegate = self;
    
    [self.view addSubview:textField];
    [self.view addSubview:webView];
    
    self.webView = webView;
    webView.backgroundColor = [UIColor whiteColor];
    [self requestURLFromTextField:textField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

#pragma mark - 텍스트필드 delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self requestURLFromTextField:textField];
    return YES;
}

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


#pragma mark - custom method
- (void)requestURLFromTextField:(UITextField *)textField {
    NSURL *url = [NSURL URLWithString:textField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}

#pragma mark - 회전방향 지원

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
