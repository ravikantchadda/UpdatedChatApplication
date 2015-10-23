//
//  ProfileViewTableViewCell.h
//  QBSampleChat
//
//  Created by ravi kant on 10/20/15.
//  Copyright © 2015 Net Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol ProfileViewTableViewCellDelegate <NSObject>

-(void)func_takeUserPhoto;

@end


@interface ProfileViewTableViewCell : UITableViewCell<ProfileViewTableViewCellDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (nonatomic,strong) id<ProfileViewTableViewCellDelegate>delegate;

@end
