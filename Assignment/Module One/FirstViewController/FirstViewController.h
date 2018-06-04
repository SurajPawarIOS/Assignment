//
//  FirstViewController.h
//  Assignment
//
//  Created by Suraj Pawar on 02/06/18.
//  Copyright © 2018 Suraj Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"


@interface FirstViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *firstViewTable;

@end
