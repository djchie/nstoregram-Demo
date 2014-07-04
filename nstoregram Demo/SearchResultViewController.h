//
//  SearchResultViewController.h
//  nstoregram Demo
//
//  Created by Derrick J Chie on 7/3/14.
//  Copyright (c) 2014 Derrick J Chie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DataProvider.h"
#import <Parse/Parse.h>

@interface SearchResultViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate>

@property (weak, nonatomic) NSString* searchString;
@property (strong, nonatomic) NSArray* searchResultArray;

@property (weak, nonatomic) IBOutlet UITableView* resultTableView;
@property (weak, nonatomic) IBOutlet MKMapView* resultMapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl* viewSegmentedControl;

- (IBAction)viewSegmentedControlPressed:(id)sender;

@end
