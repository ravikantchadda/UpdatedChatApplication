//
//  ProfileVC.m
//  QBSampleChat
//
//  Created by ravi kant on 9/22/15.
//  Copyright © 2015 Net Solutions. All rights reserved.
//

#import "ProfileVC.h"
#import "ProfileViewTableViewCell.h"

@interface ProfileVC ()<ProfileViewTableViewCellDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, readonly) UIImagePickerController* pickerController;

@end

@implementation ProfileVC
@synthesize pickerController = _pickerController;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"profilepiccellidentifier"];
        QBUUser *user = [QBChat instance].currentUser;

    if (indexPath.row==0) {
        
        ProfileViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"profilepiccellidentifier"];
        cell.delegate = self;
        
        cell.userImage.layer.cornerRadius = cell.userImage.frame.size.width/2.0;
        cell.userImage.layer.borderColor = [UIColor darkGrayColor].CGColor;
        cell.userImage.layer.borderWidth = 1.0;
        
        
        
        
        [[ServicesManager instance].chatService.chatAttachmentService getProfileImageForUsers:[@(user.blobID) stringValue] completion:^(NSError *error, UIImage *image) {
            
            if (image != nil) {
                
                cell.userImage.image = image;
            }
            
        }];
        
       
        return cell;

        
    }else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userdetailidentifier"];
        
        
        
        UILabel *lblFullName = (UILabel *)[cell viewWithTag:202];
         UILabel *lblEmail = (UILabel *)[cell viewWithTag:203];
        
        lblFullName.text = user.fullName;
        lblEmail.text = user.email;
        
        return cell;
    
    }
    
    return cell;


}


-(void)func_takeUserPhoto{
    UIAlertController *_alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *_actionTakePhoto = [UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * __nonnull action) {
        
        self.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.pickerController.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie,(NSString *)kUTTypeImage,      nil];
        [self presentViewController:self.pickerController animated:YES completion:nil];
        
        [_alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *_actionPhotoLibrary = [UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * __nonnull action) {
        
        self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.pickerController.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie,(NSString *)kUTTypeImage,      nil];
        [self presentViewController:self.pickerController animated:YES completion:nil];

        
        [_alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
    UIAlertAction *_actionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * __nonnull action) {
        
        [_alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [_alertController addAction:_actionTakePhoto];
    [_alertController addAction:_actionPhotoLibrary];
    [_alertController addAction:_actionCancel];
    
    [self presentViewController:_alertController animated:YES completion:nil];
    


}

- (UIImagePickerController *)pickerController
{
    if (_pickerController == nil) {
        _pickerController = [UIImagePickerController new];
        _pickerController.delegate = self;
    }
    return _pickerController;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
        [picker dismissViewControllerAnimated:YES completion:NULL];
    
        UIImage* image = info[UIImagePickerControllerOriginalImage];
   
        [self uploadProfileImageWithImage:image];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void)uploadProfileImageWithImage:(UIImage*)image{
    
    QBUUser *user = [QBChat instance].currentUser;
    [SVProgressHUD showWithStatus:@"Uploading" maskType:SVProgressHUDMaskTypeClear];

     [[ServicesManager instance].chatService.chatAttachmentService uploadUserImageWithAttachedImage:image ofUser:user completion:^(NSError *error) {
         
         dispatch_async(dispatch_get_main_queue(), ^{
             
             if (error != nil) {
                 
                 [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                 
             } else {
                 
                 [SVProgressHUD showSuccessWithStatus:@"Completed"];
                 
                 [self.tableView reloadData];
            
                 
                 
                 
             }
             
         });
         
     }];


}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
