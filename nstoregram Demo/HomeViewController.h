//
//  ViewController.h
//  nstoregram Demo
//
//  Created by Derrick J Chie on 6/30/14.
//  Copyright (c) 2014 Derrick J Chie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataProvider.h"
#import <Parse/Parse.h>
#import "SearchResultViewController.h"

@interface HomeViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) NSString* cachedSearchString;

@property (weak, nonatomic) IBOutlet UITextField* searchTextField;

@end
