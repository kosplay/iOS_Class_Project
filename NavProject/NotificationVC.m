//
//  NotificationVC.m
//  NavProject
//
//  Created by Student on 12/4/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "NotificationVC.h"
#import "AppModel.h"
#import <GoogleOpenSource/GoogleOpenSource.h>

//#define SELFY_SIEZ 50

@interface NotificationVC ()

@end

@implementation NotificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppModel *app = [AppModel sharedAppModel];
    GTLPlusPerson *me = app.me;
    self.nameLabel.text = me.displayName;
    NSString *url = [NSString stringWithFormat: @"%@",me.image.url];
    self.selfy.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    
    
}

-(void)viewDidAppear:(BOOL)animated {
    //this is called when the view is presented modally
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

@end
