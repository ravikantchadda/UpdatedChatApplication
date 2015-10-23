//
//  ImageViewerVC.m
//  QBSampleChat
//
//  Created by ravi kant on 10/16/15.
//  Copyright © 2015 Net Solutions. All rights reserved.
//

#import "ImageViewerVC.h"

@interface ImageViewerVC ()

@end

@implementation ImageViewerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setImage:[[NSUserDefaults standardUserDefaults]objectForKey:@"imagepath"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setImage:(NSString *)Path{
    
NSData *imgData = [NSData dataWithContentsOfFile:Path];
    
self.imgViewer.image = [UIImage imageWithData:imgData];

}

- (IBAction)done:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
