//
//  ViewController.m
//  nstoregram Demo
//
//  Created by Derrick J Chie on 6/30/14.
//  Copyright (c) 2014 Derrick J Chie. All rights reserved.
//

#import "ViewController.h"
#import "DataProvider.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArrayBlock block = ^(NSArray *obj, NSError *error)
    {
        if (!error)
        {
            for (PFObject *aObj in obj)
            {
                NSLog(@"name of object %@", aObj[@"name"]);
            }
        }
    };
	// Do any additional setup after loading the view, typically from a nib.
    [[DataProvider sharedInstance] queryProductByName:@"oil"
                                           completion:block];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
