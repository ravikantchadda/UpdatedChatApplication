//
//  CallViewController.h
//  QBSampleChat
//
//  Created by ravi kant on 10/21/15.
//  Copyright © 2015 Net Solutions. All rights reserved.
//

#import "BaseViewController.h"

@class QBRTCSession;

@interface CallViewController : BaseViewController

@property (strong, nonatomic) QBRTCSession *session;

@end

