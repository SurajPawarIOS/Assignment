//
//  BaseClassViewController.m
//  Project_Initation_ObjC
//
//  Created by Suraj Pawar on 17/02/18.
//  Copyright © 2018 Suraj Pawar. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - *** Alert Controller ***

-(void)alertController:(NSString *)title alertMessage:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:[NSString okButton] style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
    }];
    
    [alertController addAction:cancle];
    [self presentViewController:alertController animated:YES completion:nil];
    
}



#pragma mark - *** MBProgressHUD ***

-(void)hudShow:(NSString *)message
{
    if(hud==nil)
    {
        hud = [[MBProgressHUD alloc] initWithView:self.view];
        hud.mode=MBProgressMaxOffset;
    }
    hud.label.text =message;
    [self.view addSubview:hud];
    [hud showAnimated:YES];
}

-(void)hudHide
{
    [hud hideAnimated:YES];
}


@end
