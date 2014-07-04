//
//  SearchResultViewController.m
//  nstoregram Demo
//
//  Created by Derrick J Chie on 7/3/14.
//  Copyright (c) 2014 Derrick J Chie. All rights reserved.
//

#import "SearchResultViewController.h"

#import "ProductResultTableViewCell.h"

#import "SVProgressHUD.h"

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
    self.searchBar.text = searchString;
    originalViewFrame = self.view.frame;
    originalNavigationFrame = self.navigationController.navigationBar.frame;
    
    resultTableView.delegate = self;
    resultTableView.dataSource = self;
    self.searchBar.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Parse Methods

- (void)searchProductsByName:(NSString *)name
{

    [SVProgressHUD  show];
    __weak typeof(self) weakSelf = self;
    NSArrayBlock block = ^(NSArray *obj, NSError *error)
    {
        if (!error)
        {
            if (obj.count > 0)
            {
                [SVProgressHUD dismiss];
                searchResultArray = obj;
                NSLog(@"SearchResultViewController::searchProductByName searchResultArray %@", searchResultArray);
                [weakSelf.resultTableView reloadData];
            }
            else
            {
                [SVProgressHUD showErrorWithStatus:@"Product not found"];
            }
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
    };
    [[DataProvider sharedInstance] queryProductByName:name completion:block];
  //  [[DataProvider sharedInstance] queryProductByNameContainsString:name completion:block];
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
    ProductResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ProductResultTableViewCell class])];
    if (!cell)
    {
        cell = [[ProductResultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:NSStringFromClass([ProductResultTableViewCell class])];
    }
    PFObject* product = searchResultArray[indexPath.row];
    
    cell.productName.text = product[@"name"];
    cell.store.text = product[@"store_name"];
    cell.price.text = [NSString stringWithFormat:@"%@", product[@"price"]];
    cell.quantity.text = [NSString stringWithFormat:@"%@", product[@"stock"]];
    cell.shortDescription.text = product[@"short_description"];
    
    // havent really tested this one yet
    // now lets try to fetch the image in the background
    PFFile *imageFile = product[@"image"];
    // always send a weakself a callblock due to retain cycles
    __weak typeof (self) weakSelf = self;
    // only get the image if the image is set
    if (!cell.imageIsSet)
    {
        if (imageFile)
        {
            [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
                if (!error)
                {
                    cell.productImageView.image = [UIImage imageWithData:data];
                    cell.imageIsSet = true;
                    // this might not be a good way to approach this
                    // we should consider handling a Key Value observer
                    // to observ whether or not an image is ever set to productImage then
                    // we can update this cell according
                    [weakSelf.resultTableView reloadData];
                    
                    
                }
            } progressBlock:^(int percentDone) {
                // we can do some loading screen here if we want
                
            }];
        }
        else
        {
            // in this case, theres no image file so the image is set
            cell.imageIsSet = true;
        }
    }

    //cell.textLabel.text = product[@"store_name"];
   // NSString* countString = [NSString stringWithFormat:@"Price: %@, Stock: %@", product[@"price"], product[@"stock"]];
   // cell.detailTextLabel.text = countString;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - SearchBar Delegate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    // animating search bar UP
    CGRect oldNav = self.navigationController.navigationBar.frame;
    CGRect newRect = CGRectMake(oldNav.origin.x, oldNav.origin.y - 64, 320, 44);
    [UIView animateWithDuration:.30
                     animations:^
     {
         self.navigationController.navigationBar.frame = newRect;
         self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 44, self.view.frame.size.width, self.view.frame.size.height);
         
         
     } completion:^(BOOL finished)
     {
     }];
    [searchBar setShowsCancelButton:YES
                           animated:YES];
    return YES;
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.searchBar setShowsCancelButton:NO
                                animated:YES];
    
    [searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    // animating search bar down
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO
                           animated:YES];
    [UIView animateWithDuration:.30
                     animations:^
     {
         self.navigationController.navigationBar.frame = originalNavigationFrame;
         self.view.frame = originalViewFrame;
         //  self.searchBar.frame = searchBarPosition;
         
     }];
    // do search here
    [self searchProductsByName:self.searchBar.text];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    // animating search bar down
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO
                           animated:YES];
    [UIView animateWithDuration:.30
                     animations:^
     {
         self.navigationController.navigationBar.frame = originalNavigationFrame;
         self.view.frame = originalViewFrame;
         //  self.searchBar.frame = searchBarPosition;
         
     }];
}

#pragma mark - MapView Methods

#pragma mark - Segue Methods
@end
