//
//  OpponentCollectionViewCell.h
//  QBSampleChat
//
//  Created by ravi kant on 10/21/15.
//  Copyright © 2015 Net Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QBRTCVideoTrack;
@interface OpponentCollectionViewCell : UICollectionViewCell
@property (assign, nonatomic) QBRTCConnectionState connectionState;

- (void)setColorMarkerText:(NSString *)text andColor:(UIColor *)color;
- (void)setVideoTrack:(QBRTCVideoTrack *)videoTrack;
@end
