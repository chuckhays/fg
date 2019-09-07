//
//  SignUpView.h
//  FG
//
//  Created by Chuck Hays on 9/6/19.
//  Copyright © 2019 Chuck Hays. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SignUpView;

@protocol SignUpViewDelegate <NSObject>

- (void)viewDidChangeData:(SignUpView *)view;
- (void)viewDidTapSignUp:(SignUpView *)view;

@end

@interface SignUpView : UIView

@property(nonatomic, readonly, weak) id<SignUpViewDelegate> delegate;
@property(nonatomic, readonly) NSString *firstName;
@property(nonatomic, readonly) NSString *email;
@property(nonatomic, readonly) NSString *password;

// Setting these properties to YES shows an error state
// on the appropriate field.
@property(nonatomic) BOOL isFirstNameError;
@property(nonatomic) BOOL isEmailError;
@property(nonatomic) BOOL isPasswordError;

// Determines whether the submit button is enabled.
@property(nonatomic) BOOL isSubmitEnabled;

- (instancetype)initWithDelegate:(id<SignUpViewDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
