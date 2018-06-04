//
//  SecondViewController.m
//  Assignment
//
//  Created by Suraj Pawar on 02/06/18.
//  Copyright © 2018 Suraj Pawar. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.secondImageView setImageWithURL:[NSURL URLWithString:_imageURL] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:NO];
}


@end
