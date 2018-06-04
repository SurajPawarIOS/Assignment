//
//  FirstViewTableCell.h
//  Assignment
//
//  Created by Suraj Pawar on 03/06/18.
//  Copyright © 2018 Suraj Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *firstCellImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstCellAge;
@property (weak, nonatomic) IBOutlet UILabel *firstCellUsername;
@property (weak, nonatomic) IBOutlet UILabel *firstCellTagline;

@end
