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
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SecondViewController.h"

@interface FirstViewController (){
    
    NSArray *userdetails;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.firstViewTable delegate];
    [self.firstViewTable dataSource];
    
    if ([appDelegate.internetAvailable isEqualToString:@"Yes"]||appDelegate.internetAvailable==nil) {
        
        [self hudShow:@"Loading.."];
        [self apiCall];
        
    }else if ([appDelegate.internetAvailable isEqualToString:@"No"]){
        [self alertController:[NSString networkError] alertMessage:[NSString networkErrorMessage]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - *** API ***

-(void) apiCall {
    
        
        //Init the NSURLSession with a configuration
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
        
        //Create an URLRequest
        NSURL *url1 = [NSURL URLWithString:assignmentURL];
    
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url1];
    
        [urlRequest setHTTPMethod:@"GET"];
    
        //Create task
        NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          {
                                              
                                              if (data==nil)
                                              {
                                                  [self hudHide];
                                              }else
                                              {
                                                  [self hudHide];
                                                  
                                                  NSError* error1;
                                                 
                            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
                                                  
                                                  
                                                  if ([[json objectForKey:@"status"]isEqualToString:@"success"])
                                                  {
                                                      

                                                      self->userdetails=[json valueForKey:@"search_result"];
                                                    
                                                      
                                                      [self.firstViewTable reloadData];
                                               
                                                  }
                                              }
                                          }];
        [dataTask resume];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 350;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [userdetails count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"FirstTableCellIdentifier";
    
    FirstViewTableCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[FirstViewTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
   [cell.firstCellImageView setImageWithURL:[NSURL URLWithString:[[userdetails objectAtIndex:indexPath.row] objectForKey:para_PhotoURL]] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    cell.firstCellAge.text = [[userdetails objectAtIndex:indexPath.row] objectForKey:para_Age];
    cell.firstCellUsername.text = [[userdetails objectAtIndex:indexPath.row] objectForKey:para_Username];
    cell.firstCellTagline.text = [[userdetails objectAtIndex:indexPath.row] objectForKey:para_Tagline];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardOne bundle:nil];
    
    SecondViewController *obj_SecondViewController=[storyboard instantiateViewControllerWithIdentifier:secondController];
    
    obj_SecondViewController.imageURL = [[userdetails objectAtIndex:indexPath.row] objectForKey:para_PhotoURL];

    [self.navigationController pushViewController:obj_SecondViewController animated:NO];
    
}
@end
