//
//  ProfileViewTableViewCell.m
//  QBSampleChat
//
//  Created by ravi kant on 10/20/15.
//  Copyright © 2015 Net Solutions. All rights reserved.
//

#import "ProfileViewTableViewCell.h"

@implementation ProfileViewTableViewCell
@synthesize delegate;

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)func_takeUserPhoto{

}


- (IBAction)buttonAction:(id)sender {
    
    [delegate func_takeUserPhoto];
  
}

@end
