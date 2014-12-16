//
//  NotificationVC.h
//  NavProject
//
//  Created by Student on 12/4/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationVC : UIViewController

@property NSString *myName;
@property NSString *aboutMe;

@property (strong, nonatomic) IBOutlet UIImageView *selfy;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end
