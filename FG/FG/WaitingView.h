//
//  WaitingView.h
//  FG
//
//  Created by Chuck Hays on 9/6/19.
//  Copyright © 2019 Chuck Hays. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WaitingView : UIView

// Start animating.
- (void)start;
// Stop animating.
- (void)stop;

@end

NS_ASSUME_NONNULL_END
