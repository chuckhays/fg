//
//  WaitingView.m
//  FG
//
//  Created by Chuck Hays on 9/6/19.
//  Copyright © 2019 Chuck Hays. All rights reserved.
//

#import "WaitingView.h"

@implementation WaitingView {
    UIActivityIndicatorView *_activityIndicator;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicator.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_activityIndicator];
        [self stop];
        [NSLayoutConstraint activateConstraints:@[
                                                  [_activityIndicator.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                  [_activityIndicator.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                                  [_activityIndicator.widthAnchor constraintEqualToAnchor:self.widthAnchor],
                                                  [_activityIndicator.heightAnchor constraintEqualToAnchor:self.heightAnchor],
                                                  ]];
    }
    return self;
}

- (void)start {
    [_activityIndicator startAnimating];
}

- (void)stop {
    [_activityIndicator stopAnimating];
}

@end
