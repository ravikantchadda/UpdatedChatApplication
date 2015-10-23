//
//  BaseVC.h
//  QBSampleChat
//
//  Created by ravi kant on 10/21/15.
//  Copyright © 2015 Net Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>


@class IAButton;

@interface BaseViewController : UIViewController

@property (strong, nonatomic) NSArray *users;

/**
 *  Create custom UIBarButtonItem instance
 */
- (UIBarButtonItem *)cornerBarButtonWithColor:(UIColor *)color
                                        title:(NSString *)title
                                didTouchesEnd:(dispatch_block_t)action;
/**
 *  Default back button
 */
- (void)setDefaultBackBarButtonItem:(dispatch_block_t)didTouchesEndAction;

/**
 *  Configure IAButton
 */
- (void)configureAIButton:(IAButton *)button
            withImageName:(NSString *)name
                  bgColor:(UIColor *)bgColor
            selectedColor:(UIColor *)selectedColor;
@end
