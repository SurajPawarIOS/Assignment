//
//  FirstViewController.m
//  Assignment
//
//  Created by Suraj Pawar on 02/06/18.
//  Copyright © 2018 Suraj Pawar. All rights reserved.
//

#import "FirstViewController.h"
#import "AFHTTPSessionManager.h"
#import "FirstViewTableCell.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([appDelegate.internetAvailable isEqualToString:@"Yes"]) {
        
        [self hudShow:@"Loading.."];
        [self apiCall];
        
    }else{
        [self alertController:[NSString networkError] alertMessage:[NSString networkErrorMessage]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) apiCall {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://betaci.abcoeur.com/search.json.php" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
       
        NSLog(@"JSON: %@", responseObject);
    
    } failure:^(NSURLSessionTask *operation, NSError *error) {
    
        NSLog(@"Error: %@", error);
    
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"FirstTableCellIdentifier";
    
    FirstViewTableCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[FirstViewTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.firstCellImageView.image = nil;
    cell.firstCellAge.text = @"";
    cell.firstCellUsername.text = @"";
    cell.firstCellTagline.text = @"";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
