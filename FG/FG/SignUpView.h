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

// Determines whether the submit button is enabled.
@property(nonatomic) BOOL isSubmitEnabled;

- (instancetype)initWithDelegate:(id<SignUpViewDelegate>)delegate NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
