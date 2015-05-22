//
//  JWLTextViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLTextViewController.h"
#import "UIColor+TintColor.h"


void CGRectPrint(CGRect, NSString *);

@interface JWLTextViewController () <UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, copy) NSString *text;

@end

@implementation JWLTextViewController

#pragma mark - 뷰컨트롤러 라이프 사이클
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"Text View";
        _text = @"This is a UITextView that uses attributed text. You can programmatically modify the display of the text by making it bold, highlighted, underlined, tinted, and more. These attributes are defined in NSAttributedString.h. You can even embed attachments in an NSAttributedString!\n";
    }
    return self;
}

#pragma mark - 뷰 라이프 사이클

- (void)viewDidLoad {
    UITextView *textView = [[UITextView alloc] init];

    CGRect frame = self.view.frame;
    CGRectPrint(frame, @"self.view.frame");


//    frame.size.height -= 20.0 + 44.0 + 49.0;
//    frame.origin.y += 20.0 + 44.0;
    textView.frame = frame;
    textView.delegate = self;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSRange boldRange = [self.text rangeOfString:@"bold"];
    NSLog(@"%lu, %lu", boldRange.location, boldRange.length);
    NSRange hilightedRange = [self.text rangeOfString:@"highlighted"];
    NSRange underlinedRange = [self.text rangeOfString:@"underlined"];
    NSRange tintedRange = [self.text rangeOfString:@"tinted"];
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"text_view_attachment_1x"];
    
    [attributedString beginEditing];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17.0] range:NSMakeRange(0, [self.text length])];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17.0]  range:boldRange];
    [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor lightGreenColor] range:hilightedRange];
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:underlinedRange];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor skyblueColor] range:tintedRange];

    
    [attributedString appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
    [attributedString endEditing];
    textView.attributedText = attributedString;

//    textView.scrollEnabled = YES;

    UIEdgeInsets contentInsets = UIEdgeInsetsMake(64.0, 0.0, 49.0, 0.0);
    textView.contentInset = contentInsets;
    textView.scrollIndicatorInsets = contentInsets;
    
    
    
    self.textView = textView;
    [self.view addSubview:self.textView];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%f, %f", self.textView.contentSize.width, self.textView.contentSize.height);

}



#pragma mark - text view delegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneEditing:)];
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    self.navigationItem.rightBarButtonItem = nil;
    
}

#pragma mark - action method

- (void)doneEditing:(UIBarButtonItem *)sender {
    [self.textView resignFirstResponder];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;

    UIEdgeInsets contentInsets = self.textView.contentInset;
    contentInsets.bottom += keyboardSize.height - 49.0;
    self.textView.contentInset = contentInsets;
    self.textView.scrollIndicatorInsets = contentInsets;
    
    
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = self.textView.contentInset;
    contentInsets.bottom -= keyboardSize.height - 49.0;
    self.textView.contentInset = contentInsets;
    self.textView.scrollIndicatorInsets = contentInsets;

}

#pragma mark - 회전방향 지원

- (BOOL)automaticallyAdjustsScrollViewInsets {
    return NO;
}



@end
