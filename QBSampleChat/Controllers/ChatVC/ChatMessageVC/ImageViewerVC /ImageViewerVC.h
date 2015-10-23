//
//  ImageViewerVC.h
//  QBSampleChat
//
//  Created by ravi kant on 10/16/15.
//  Copyright © 2015 Net Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewerVC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imgViewer;
- (IBAction)done:(id)sender;
-(void)setImage:(NSString *)Path;

@end
