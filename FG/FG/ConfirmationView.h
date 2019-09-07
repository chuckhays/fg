//
//  ConfirmationView.h
//  FG
//
//  Created by Chuck Hays on 9/6/19.
//  Copyright © 2019 Chuck Hays. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ConfirmationView;

@protocol ConfirmationViewDelegate

- (void)viewDidTapSubmit:(ConfirmationView *)view;

@end

@interface ConfirmationView : UIView

@property(nonatomic, weak) id<ConfirmationViewDelegate> delegate;

- (instancetype)initWithFirstName:(NSString *)firstName
                            email:(NSString *)email
                         delegate:(id<ConfirmationViewDelegate>)delegate
    NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
