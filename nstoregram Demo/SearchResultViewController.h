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

@interface SearchResultViewController : UIViewController <UITableViewDataSource,
                                                          UITableViewDelegate,
                                                          MKMapViewDelegate,
                                                          UISearchBarDelegate,
                                                          CLLocationManagerDelegate>
{
    CGRect originalViewFrame;
    CGRect originalNavigationFrame;
}

@property (strong, nonatomic) NSString* searchString;
@property (strong, nonatomic) NSArray* searchResultArray;
@property (strong, nonatomic) CLLocationManager* locationManager;
@property (strong, nonatomic) CLLocation* currentLocation;

@property (weak, nonatomic) IBOutlet UITableView* resultTableView;
@property (weak, nonatomic) IBOutlet MKMapView* resultMapView;

@property (weak, nonatomic) IBOutlet UISegmentedControl* viewSegmentedControl;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)viewSegmentedControlPressed:(id)sender;

@end
