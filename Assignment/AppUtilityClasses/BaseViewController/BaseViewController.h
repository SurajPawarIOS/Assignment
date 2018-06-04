//
//  BaseClassViewController.h
//  Project_Initation_ObjC
//
//  Created by Suraj Pawar on 17/02/18.
//  Copyright © 2018 Suraj Pawar. All rights reserved.
//

//Frameworks
#import <UIKit/UIKit.h>

//Librarys
#import "MBProgressHUD.h"
#import "AFHTTPSessionManager.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import <SDWebImage/UIImageView+WebCache.h>

//Utility Classes
#import "NSString+AlertMessages.h"
#import "APIConstants.h"
#import "AppDelegate.h"

@interface BaseViewController : UIViewController{
    MBProgressHUD *hud;
    AppDelegate *appDelegate;
}

#pragma mark - *** Alert Controller ***
-(void)alertController:(NSString *)title alertMessage:(NSString *)message;

#pragma mark - *** MBProgressHUD ***
-(void)hudShow:(NSString *)message;
-(void)hudHide;

@end
