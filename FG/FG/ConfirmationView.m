//
//  ConfirmationView.m
//  FG
//
//  Created by Chuck Hays on 9/6/19.
//  Copyright © 2019 Chuck Hays. All rights reserved.
//

#import "ConfirmationView.h"

@implementation ConfirmationView {
    UILabel *_heading1;
    UILabel *_heading2;
    UILabel *_helpText;
    UILabel *_emailLabel;
    UIButton *_submitButton;
}

- (instancetype)initWithFirstName:(NSString *)firstName email:(NSString *)email delegate:(id<ConfirmationViewDelegate>)delegate {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _delegate = delegate;
        
        _heading1 = [[UILabel alloc] initWithFrame:CGRectZero];
        _heading1.text = NSLocalizedString(@"Welcome,", nil);
        _heading1.translatesAutoresizingMaskIntoConstraints = NO;
        _heading1.font = [UIFont systemFontOfSize:20];
        _heading2 = [[UILabel alloc] initWithFrame:CGRectZero];
        NSString *firstNameFormat = NSLocalizedString(@"%@!", nil);
        _heading2.text = [NSString stringWithFormat:firstNameFormat, firstName];
        _heading2.font = [UIFont systemFontOfSize:22 weight:UIFontWeightBold];
        _heading2.translatesAutoresizingMaskIntoConstraints = NO;
        _helpText = [[UILabel alloc] initWithFrame:CGRectZero];
        _helpText.text = NSLocalizedString(@"You have been registered for this awesome service. Please check your email listed below for instructions.", nil);
        _helpText.font = [UIFont systemFontOfSize:16];
        _helpText.numberOfLines = 0;
        _helpText.translatesAutoresizingMaskIntoConstraints = NO;
        _emailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _emailLabel.text = email;
        _emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _emailLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
        
        _submitButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_submitButton setTitle:NSLocalizedString(@"Sign In", nil) forState:UIControlStateNormal];
        _submitButton.translatesAutoresizingMaskIntoConstraints = NO;
        _submitButton.backgroundColor = [UIColor colorWithRed:177/255.0 green:57/255.0 blue:112/255.0 alpha:1.0];
        _submitButton.layer.cornerRadius = 5;
        _submitButton.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        [_submitButton addTarget:self
                          action:@selector(didTapButton:)
                forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_heading1];
        [self addSubview:_heading2];
        [self addSubview:_helpText];
        [self addSubview:_emailLabel];
        [self addSubview:_submitButton];
        
        CGFloat columnWidth = 300;
        CGFloat margin = 20;
        
        [NSLayoutConstraint activateConstraints:@[
                                                  [_heading1.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                  [_heading1.widthAnchor constraintEqualToConstant:columnWidth],
                                                  [_heading1.topAnchor constraintEqualToAnchor:self.topAnchor constant:margin * 2],
                                                  [_heading2.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                  [_heading2.widthAnchor constraintEqualToConstant:columnWidth],
                                                  [_heading2.topAnchor constraintEqualToAnchor:_heading1.bottomAnchor],
                                                  [_helpText.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                  [_helpText.widthAnchor constraintEqualToConstant:columnWidth],
                                                  [_helpText.topAnchor constraintEqualToAnchor:_heading2.bottomAnchor constant:margin/2],
                                                  [_emailLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                  [_emailLabel.widthAnchor constraintEqualToConstant:columnWidth],
                                                  [_emailLabel.topAnchor constraintEqualToAnchor:_helpText.bottomAnchor constant:margin],
                                                  [_submitButton.topAnchor constraintEqualToAnchor:_emailLabel.bottomAnchor constant:100],
                                                  [_submitButton.trailingAnchor constraintEqualToAnchor:_emailLabel.trailingAnchor],
                                                  ]];
    }
    return self;
}

#pragma mark - Private

- (void)didTapButton:(UIButton *)button {
    [_delegate viewDidTapSubmit:self];
}


@end
