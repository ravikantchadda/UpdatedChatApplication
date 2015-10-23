//
//  Constant.h
//  QBSampleChat
//
//  Created by ravi kant on 9/22/15.
//  Copyright © 2015 Net Solutions. All rights reserved.
//

#ifndef Constant_h
#define Constant_h


//0-release, 1-dev, 2-qa, 3-android
#define QB_RTC_SAMPLE_MODE 0

#if (QB_RTC_SAMPLE_MODE == 0)
#define QB_VERSION_STR @"release"
#elif (QB_RTC_SAMPLE_MODE == 1)
#define QB_VERSION_STR @"dev"
#elif (QB_RTC_SAMPLE_MODE == 2)
#define QB_VERSION_STR @"qa"
#elif (QB_RTC_SAMPLE_MODE == 3)
#define QB_VERSION_STR @"android"
#endif


/**
 *  UsersService
 */
static NSString *const kTestUsersTableKey = @"test_users";
static NSString *const kUserFullNameKey = @"fullname";
static NSString *const kUserLoginKey = @"login";
static NSString *const kUserPasswordKey = @"password";

/**
 *  UsersDataSource
 */
static NSString *const kUserTableViewCellIdentifier = @"UserTableViewCellIdentifier";

/**
 *  ServicesManager
 */
static NSString *const kChatCacheNameKey = @"sample-cache";
static NSString *const kContactListCacheNameKey = @"sample-cache-contacts";


/**
 *  NewChatVC
 */
static NSString *const kGoToNewChatSegueIdentifier = @"newchat";

/**
 *  GroupChatVC
 */
static NSString *const kGoToGroupchatSegueIdentifier = @"groupchat";

/**
 *  ChatMessageVC
 */
static NSString *const kGoToMessageControllerSegueIdentifier = @"chatmessageviewcontroller";

/**
 *  ChatVC
 */
static const NSUInteger kDialogsPageLimit = 10;

#define CGRECT(X,Y,W,H)  CGRectMake(X, Y, W, H)


#define kDeviceHeight [[UIScreen mainScreen] bounds].size.height
#define kDeviceWidth [[UIScreen mainScreen] bounds].size.width

#define kAlertInternetCheck @"Please connect to internet"
#define kAlertEmailVerification @"Please enter a valid email address."
#define kAlertEnterEmail @"Required email."
#define kAlertEnterName @"Required name."
#define kAlertNameLength @"Name should be at least 4 characters."
#endif /* Constant_h */
