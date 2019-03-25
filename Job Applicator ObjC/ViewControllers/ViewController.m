//
//  ViewController.m
//  Job Applicator ObjC
//
//  Created by Terence Baker on 25/03/2019.
//  Copyright © 2019 Bulb Studios Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak) IBOutlet UITextField *nameField;
@property(nonatomic, weak) IBOutlet UITextField *emailField;
@property(nonatomic, weak) IBOutlet UITextField *teamField;
@property(nonatomic, weak) IBOutlet UITextView *aboutView;
@property(nonatomic, weak) IBOutlet UITextView *urlView;
@property(nonatomic, weak) IBOutlet UIButton *submitButton;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
}

- (void)handleApplicationResponse {
}

#pragma mark IBAction

- (IBAction)submitButtonPressed {
}

#pragma mark UITextFieldDelegate

- (IBAction)textFieldDidChange:(UITextField *)textField {
}

#pragma mark UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
}
@end
