//
//  ViewController.m
//  FG
//
//  Created by Chuck Hays on 9/6/19.
//  Copyright © 2019 Chuck Hays. All rights reserved.
//

#import "SignUpViewController.h"

#import "ConfirmationView.h"
#import "SignUpView.h"
#import "WaitingView.h"

@interface SignUpViewController () <SignUpViewDelegate, ConfirmationViewDelegate>

@property(nonatomic, readonly) SignUpView *signUpView;
@property(nonatomic, readonly) WaitingView *waitingView;
@property(nonatomic, readonly) ConfirmationView *confirmationView;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _signUpView = [[SignUpView alloc] initWithDelegate:self];
    _signUpView.frame = self.view.bounds;
    _signUpView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_signUpView];
    
    _waitingView = [[WaitingView alloc] initWithFrame:CGRectZero];
    _waitingView.frame = self.view.bounds;
    _waitingView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _waitingView.hidden = YES;
    _waitingView.alpha = 0;
    [self.view addSubview:_waitingView];
}

#pragma mark - SignUpViewDelegate

- (void)viewDidChangeData:(SignUpView *)view {
    // Require each field to have a value.
    // Additional validation could go here for fields.
    BOOL shouldEnable =
        _signUpView.firstName.length > 0 &&
        _signUpView.email.length > 0 &&
        _signUpView.password.length > 0;
    _signUpView.isSubmitEnabled = shouldEnable;
}

- (void)viewDidTapSignUp:(SignUpView *)view {
    // Transition to waiting view.
    _waitingView.hidden = NO;
    [_waitingView start];
    [UIView animateWithDuration:.75
                     animations:^{
                         self.signUpView.alpha = 0;
                         self.waitingView.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         self.signUpView.hidden = YES;
                     }];
    // Simulate async API call.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self transitionToConfirmation];
    });
}

#pragma mark - ConfirmationViewDelegate

- (void)viewDidTapSubmit:(ConfirmationView *)view {
    // Execute sign in flow.
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Sign In", nil)
                                                                   message:NSLocalizedString(@"Not yet implemented", nil)
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil)
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Private

- (void)transitionToConfirmation {
    if (!_confirmationView) {
        _confirmationView = [[ConfirmationView alloc] initWithFirstName:_signUpView.firstName
                                                                  email:_signUpView.email
                                                               delegate:self];
        _confirmationView.autoresizingMask =
            UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _confirmationView.frame = self.view.bounds;
        _confirmationView.alpha = 0;
        [self.view addSubview:_confirmationView];
    }
    [UIView animateWithDuration:.75
                     animations:^{
                         self.waitingView.alpha = 0;
                         self.confirmationView.alpha = 1;
                     }];
}

@end
