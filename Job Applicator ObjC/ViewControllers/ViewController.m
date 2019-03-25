//
//  ViewController.m
//  Job Applicator ObjC
//
//  Created by Terence Baker on 25/03/2019.
//  Copyright © 2019 Bulb Studios Ltd. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "JobApplication.h"

@interface ViewController ()

@property(nonatomic, weak) IBOutlet UITextField *nameField;
@property(nonatomic, weak) IBOutlet UITextField *emailField;
@property(nonatomic, weak) IBOutlet UITextField *teamField;
@property(nonatomic, weak) IBOutlet UITextView *aboutView;
@property(nonatomic, weak) IBOutlet UITextView *urlView;
@property(nonatomic, weak) IBOutlet UIButton *submitButton;

@property(nonatomic, strong) ViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.viewModel = [ViewModel new];

    [self handleTextChanged];
}

- (void)handleTextChanged {

    self.submitButton.enabled = [self.viewModel validateApplicationWithName:self.nameField.text
                                                                      email:self.emailField.text
                                                                      teams:self.teamField.text
                                                                      about:self.aboutView.text
                                                                       urls:self.urlView.text];
}

- (void)handleApplicationResponse:(JobApplication *)application error:(NSError *)error {

    NSString *response = nil;

    if (application != nil) {

        response = NSLocalizedStringFromTable(@"applicationReceived", @"Content", nil);
        NSLog(@"%@: %@", response, application);
    }
    else {

        response = NSLocalizedStringFromTable(@"applicationError", @"Content", nil);
        NSLog(@"%@: %@", response, error);
    }

    if (response != nil) {

        UIAlertController *controller = [UIAlertController alertControllerWithTitle:response message:nil preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:NSLocalizedStringFromTable(@"ok", @"Content", nil) style:UIAlertActionStyleDefault handler:nil]];
        controller.view.tintColor = [UIColor colorNamed:@"DarkJazzBlue"];
        [self presentViewController:controller animated:YES completion:^{

            controller.view.tintColor = [UIColor colorNamed:@"DarkJazzBlue"];
        }];
    }
}

#pragma mark IBAction

- (IBAction)submitButtonPressed {

    JobApplication *application = [self.viewModel createApplicationWithName:self.nameField.text
                                                                      email:self.emailField.text
                                                                      teams:self.teamField.text
                                                                      about:self.aboutView.text
                                                                       urls:self.urlView.text];

    __weak typeof(self) weakSelf = self;

    [self.viewModel performApplyRequest:application
                      completionHandler:^(JobApplication *application, NSError *error) {

                          [weakSelf handleApplicationResponse:application error:error];
                      }];
}

#pragma mark UITextFieldDelegate

- (IBAction)textFieldDidChange:(UITextField *)textField {

    [self handleTextChanged];
}

#pragma mark UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {

    [self handleTextChanged];
}
@end
