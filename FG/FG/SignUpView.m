//
//  SignUpView.m
//  FG
//
//  Created by Chuck Hays on 9/6/19.
//  Copyright © 2019 Chuck Hays. All rights reserved.
//

#import "SignUpView.h"

@implementation SignUpView {
    UILabel *_heading1;
    UILabel *_heading2;
    UILabel *_helpText;
    UITextField *_firstNameField;
    UITextField *_emailField;
    UITextField *_passwordField;
    UIButton *_submitButton;
}

- (instancetype)initWithDelegate:(id<SignUpViewDelegate>)delegate {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _delegate = delegate;
        
        _heading1 = [[UILabel alloc] initWithFrame:CGRectZero];
        _heading1.text = NSLocalizedString(@"Let's", nil);
        _heading1.translatesAutoresizingMaskIntoConstraints = NO;
        _heading1.font = [UIFont systemFontOfSize:20];
        _heading2 = [[UILabel alloc] initWithFrame:CGRectZero];
        _heading2.text = NSLocalizedString(@"Sign Up", nil);
        _heading2.font = [UIFont systemFontOfSize:22 weight:UIFontWeightBold];
        _heading2.translatesAutoresizingMaskIntoConstraints = NO;
        _helpText = [[UILabel alloc] initWithFrame:CGRectZero];
        _helpText.text = NSLocalizedString(@"Use the form below to sign up for this super awesome service. You're only a few steps away!", nil);
        _helpText.font = [UIFont systemFontOfSize:16];
        _helpText.numberOfLines = 0;
        _helpText.translatesAutoresizingMaskIntoConstraints = NO;
        
        _firstNameField = [[UITextField alloc] initWithFrame:CGRectZero];
        _firstNameField.placeholder = NSLocalizedString(@"First Name", nil);
        _firstNameField.translatesAutoresizingMaskIntoConstraints = NO;
        [_firstNameField addTarget:self
                            action:@selector(textFieldDidChange:)
                  forControlEvents:UIControlEventEditingChanged];
        _emailField = [[UITextField alloc] initWithFrame:CGRectZero];
        _emailField.placeholder = NSLocalizedString(@"Email Address", nil);
        _emailField.keyboardType = UIKeyboardTypeEmailAddress;
        _emailField.translatesAutoresizingMaskIntoConstraints = NO;
        [_emailField addTarget:self
                        action:@selector(textFieldDidChange:)
              forControlEvents:UIControlEventEditingChanged];
        _passwordField = [[UITextField alloc] initWithFrame:CGRectZero];
        _passwordField.placeholder = NSLocalizedString(@"Password", nil);
        _passwordField.secureTextEntry = YES;
        _passwordField.translatesAutoresizingMaskIntoConstraints = NO;
        [_passwordField addTarget:self
                           action:@selector(textFieldDidChange:)
                 forControlEvents:UIControlEventEditingChanged];
        
        _submitButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_submitButton setTitle:NSLocalizedString(@"Sign Up", nil) forState:UIControlStateNormal];
        _submitButton.translatesAutoresizingMaskIntoConstraints = NO;
        _submitButton.backgroundColor = [UIColor colorWithRed:177/255.0 green:57/255.0 blue:112/255.0 alpha:1.0];
        _submitButton.layer.cornerRadius = 5;
        _submitButton.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        _submitButton.enabled = NO;
        [_submitButton addTarget:self
                          action:@selector(didTapButton:)
                forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:_heading1];
        [self addSubview:_heading2];
        [self addSubview:_helpText];
        [self addSubview:_firstNameField];
        [self addSubview:_emailField];
        [self addSubview:_passwordField];
        [self addSubview:_submitButton];
        
        CGFloat columnWidth = 300;
        CGFloat margin = 20;
        
        [NSLayoutConstraint activateConstraints:@[
                                                  [_heading1.leadingAnchor constraintEqualToAnchor:_firstNameField.leadingAnchor],
                                                  [_heading1.widthAnchor constraintEqualToConstant:columnWidth],
                                                  [_heading1.topAnchor constraintEqualToAnchor:self.topAnchor constant:margin * 2],
                                                  [_heading2.leadingAnchor constraintEqualToAnchor:_firstNameField.leadingAnchor],
                                                  [_heading2.widthAnchor constraintEqualToConstant:columnWidth],
                                                  [_heading2.topAnchor constraintEqualToAnchor:_heading1.bottomAnchor],
                                                  [_helpText.leadingAnchor constraintEqualToAnchor:_firstNameField.leadingAnchor],
                                                  [_helpText.widthAnchor constraintEqualToConstant:columnWidth],
                                                  [_helpText.topAnchor constraintEqualToAnchor:_heading2.bottomAnchor constant:margin/2],
                                                  [_firstNameField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                  [_firstNameField.widthAnchor constraintEqualToConstant:columnWidth],
                                                  [_firstNameField.topAnchor constraintEqualToAnchor:_helpText.bottomAnchor constant:margin],
                                                  [_emailField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                  [_emailField.widthAnchor constraintEqualToConstant:columnWidth],
                                                  [_emailField.topAnchor constraintEqualToAnchor:_firstNameField.bottomAnchor constant:margin],
                                                  [_passwordField.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                  [_passwordField.widthAnchor constraintEqualToConstant:columnWidth],
                                                  [_passwordField.topAnchor constraintEqualToAnchor:_emailField.bottomAnchor constant:margin],
                                                  [_submitButton.topAnchor constraintEqualToAnchor:_passwordField.bottomAnchor constant:margin],
                                                  [_submitButton.trailingAnchor constraintEqualToAnchor:_passwordField.trailingAnchor],
                                                  ]];
    }
    return self;
}

- (NSString *)firstName {
    return _firstNameField.text;
}

- (NSString *)email {
    return _emailField.text;
}

- (NSString *)password {
    return _passwordField.text;
}

- (BOOL)isSubmitEnabled {
    return _submitButton.enabled;
}

- (void)setIsSubmitEnabled:(BOOL)isSubmitEnabled {
    _submitButton.enabled = isSubmitEnabled;
}

- (void)textFieldDidChange:(UITextField *)textField {
    [_delegate viewDidChangeData:self];
}

- (void)didTapButton:(UIButton *)button {
    [_delegate viewDidTapSignUp:self];
}


@end
