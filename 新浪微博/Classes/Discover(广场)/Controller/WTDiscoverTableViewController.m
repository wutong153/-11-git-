//
//  WTDiscoverTableViewController.m
//  新浪微博
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "WTDiscoverTableViewController.h"
#import "TWSearchBar.h"
@interface WTDiscoverTableViewController ()

@end

@implementation WTDiscoverTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TWSearchBar * searchBar = [[TWSearchBar alloc]init];
    searchBar.frame = CGRectMake(0, 0, 300, 32);
    
    self.navigationItem.titleView = searchBar;
}


@end
