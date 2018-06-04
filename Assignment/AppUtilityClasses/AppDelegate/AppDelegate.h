//
//  AppDelegate.h
//  Project_Initation_ObjC
//
//  Created by Suraj Pawar on 17/02/18.
//  Copyright © 2018 Suraj Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AFNetworkReachabilityManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (strong, nonatomic) NSString *internetAvailable;

- (void)saveContext;


@end

