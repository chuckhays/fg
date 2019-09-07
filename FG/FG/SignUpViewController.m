//
//  ViewController.m
//  FG
//
//  Created by Chuck Hays on 9/6/19.
//  Copyright © 2019 Chuck Hays. All rights reserved.
//

#import "SignUpViewController.h"

#import "SignUpView.h"

@interface SignUpViewController () <SignUpViewDelegate>

@end

@implementation SignUpViewController {
    SignUpView *_signUpView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _signUpView = [[SignUpView alloc] initWithDelegate:self];
    _signUpView.frame = self.view.bounds;
    _signUpView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_signUpView];
}

#pragma mark - SignUpViewDelegate

- (void)viewDidChangeData:(SignUpView *)view {
    
}

- (void)viewDidTapSignUp:(SignUpView *)view {
    
}


@end
