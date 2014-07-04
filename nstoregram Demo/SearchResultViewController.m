//
//  SearchResultViewController.m
//  nstoregram Demo
//
//  Created by Derrick J Chie on 7/3/14.
//  Copyright (c) 2014 Derrick J Chie. All rights reserved.
//

#import "SearchResultViewController.h"

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

@synthesize searchString;
@synthesize searchResultArray;
@synthesize resultTableView;
@synthesize resultMapView;
@synthesize viewSegmentedControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self searchProductsByName:searchString];

    resultTableView.delegate = self;
    resultTableView.dataSource = self;

//    [resultTableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [resultTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Parse Methods

- (void)searchProductsByName:(NSString *)name
{
    NSArrayBlock block = ^(NSArray *obj, NSError *error)
    {
        if (!error)
        {
            searchResultArray = obj;
        }
    };


    [[DataProvider sharedInstance] queryProductByName:name completion:block];
}

#pragma mark - Action Methods

- (IBAction)viewSegmentedControlPressed:(id)sender
{
    if (viewSegmentedControl.selectedSegmentIndex == 0)
    {
        resultTableView.hidden = NO;
        resultMapView.hidden = YES;
    }
    else if (viewSegmentedControl.selectedSegmentIndex == 1)
    {
        resultTableView.hidden = YES;
        resultMapView.hidden = NO;
    }
}

#pragma mark - TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return searchResultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    PFObject* product = searchResultArray[indexPath.row];

    cell.textLabel.text = product[@"store_name"];
    NSString* countString = [NSString stringWithFormat:@"Price: %@, Stock: %@", product[@"price"], product[@"stock"]];
    cell.detailTextLabel.text = countString;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - MapView Methods

#pragma mark - Segue Methods
@end
