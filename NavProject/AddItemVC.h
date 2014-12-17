//
//  AddItemVC.h
//  NavProject
//
//  Created by Student on 12/16/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *itemNameView;
@property (strong, nonatomic) IBOutlet UITextField *quantityView;
@property (strong, nonatomic) IBOutlet UITextField *pricePerUnitView;

-(IBAction)addItem:(id)sender;
-(IBAction)cancelAdd:(id)sender;

@end
