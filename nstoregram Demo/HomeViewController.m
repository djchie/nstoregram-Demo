//
//  ViewController.m
//  nstoregram Demo
//
//  Created by Derrick J Chie on 6/30/14.
//  Copyright (c) 2014 Derrick J Chie. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize cachedSearchString;
@synthesize searchTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];

    searchTextField.delegate = self;

//    NSArrayBlock block = ^(NSArray *obj, NSError *error)
//    {
//        if (!error)
//        {
//            for (PFObject *aObj in obj)
//            {
//                NSLog(@"name of object %@", aObj[@"name"]);
//            }
//        }
//    };
//	// Do any additional setup after loading the view, typically from a nib.
//    [[DataProvider sharedInstance] queryProductByName:@"oil"
//                                           completion:block];

    /*
    Smoke Shops
    Clothing
    Video Games
    Sporting Goods
    Auto Parts
    Consumer Electronics
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Parse Methods

- (void)addProduct:(NSString *)productName
       forCategory:(NSString *)productCategory
      withMinStock:(int)minStock
      withMaxStock:(int)maxStock
      withMinPrice:(int)minPrice
      withMaxPrice:(int)maxPrice
{
    // figure out the product name and category and short description
    // query companies with matching categories
    // for each company, set a similar price and stock amount (some being 0)

    NSArrayBlock block = ^(NSArray *obj, NSError *error)
    {
        if (!error)
        {
            for (PFObject *store in obj)
            {
                NSLog(@"name of object %@", store[@"name"]);

                PFObject *product = [PFObject objectWithClassName:@"Product"];
                product[@"store_name"] = store[@"name"];
                product[@"store_id"] = store.objectId;
                product[@"category"] = productCategory;
                product[@"name"] = productName;
                product[@"short_description"] = [NSString stringWithFormat:@"This %@ is available exclusively at %@.", productName, store[@"name"]];
                product[@"stock"] = @((arc4random() % (maxStock + 1)) + minStock);
                product[@"price"] = @((arc4random() % (maxPrice + 1)) + minPrice);
                
                [product saveInBackground];
            }
        }
    };

    [[DataProvider sharedInstance] queryStoreByCategory:productCategory completion:block];

}

- (void)addTestProductsToDatabase
{
    [self addProduct:@"Coals" forCategory:@"Smoke Shops" withMinStock:0 withMaxStock:50 withMinPrice:1 withMaxPrice:6];

    [self addProduct:@"Pipe" forCategory:@"Smoke Shops" withMinStock:0 withMaxStock:20 withMinPrice:5 withMaxPrice:15];

    [self addProduct:@"Pipe" forCategory:@"Auto Parts" withMinStock:0 withMaxStock:8 withMinPrice:25 withMaxPrice:70];

    [self addProduct:@"CD" forCategory:@"Video Games" withMinStock:0 withMaxStock:30 withMinPrice:3 withMaxPrice:10];

    [self addProduct:@"CD" forCategory:@"Consumer Electronics" withMinStock:0 withMaxStock:30 withMinPrice:3 withMaxPrice:10];

    [self addProduct:@"Shoes" forCategory:@"Clothing" withMinStock:0 withMaxStock:20 withMinPrice:30 withMaxPrice:70];

    [self addProduct:@"Shoes" forCategory:@"Sporting Goods" withMinStock:0 withMaxStock:40 withMinPrice:40 withMaxPrice:80];

    [self addProduct:@"Battery" forCategory:@"Consumer Electronics" withMinStock:0 withMaxStock:100 withMinPrice:3 withMaxPrice:7];

    [self addProduct:@"Battery" forCategory:@"Video Games" withMinStock:0 withMaxStock:40 withMinPrice:4 withMaxPrice:10];

    [self addProduct:@"Shirt" forCategory:@"Clothing" withMinStock:0 withMaxStock:20 withMinPrice:5 withMaxPrice:25];

    [self addProduct:@"Shirt" forCategory:@"Sporting Goods" withMinStock:0 withMaxStock:20 withMinPrice:20 withMaxPrice:60];

    [self addProduct:@"Ball" forCategory:@"Auto Parts" withMinStock:0 withMaxStock:80 withMinPrice:5 withMaxPrice:15];

    [self addProduct:@"Ball" forCategory:@"Sporting Goods" withMinStock:0 withMaxStock:50 withMinPrice:15 withMaxPrice:70];

    [self addProduct:@"Charger" forCategory:@"Video Games" withMinStock:0 withMaxStock:30 withMinPrice:15 withMaxPrice:20];

    [self addProduct:@"Charger" forCategory:@"Auto Parts" withMinStock:0 withMaxStock:10 withMinPrice:80 withMaxPrice:120];

    [self addProduct:@"Charger" forCategory:@"Consumer Electronics" withMinStock:0 withMaxStock:40 withMinPrice:20 withMaxPrice:30];

    [self addProduct:@"Racket" forCategory:@"Sporting Goods" withMinStock:0 withMaxStock:30 withMinPrice:90 withMaxPrice:200];

    [self addProduct:@"Game Console" forCategory:@"Consumer Electronics" withMinStock:0 withMaxStock:40 withMinPrice:200 withMaxPrice:400];

    [self addProduct:@"Game Console" forCategory:@"Video Games" withMinStock:0 withMaxStock:40 withMinPrice:200 withMaxPrice:400];

    [self addProduct:@"Candy" forCategory:@"Smoke Shops" withMinStock:0 withMaxStock:100 withMinPrice:1 withMaxPrice:5];

    [self addProduct:@"Candy" forCategory:@"Clothing" withMinStock:0 withMaxStock:100 withMinPrice:1 withMaxPrice:5];

    [self addProduct:@"Candy" forCategory:@"Video Games" withMinStock:0 withMaxStock:100 withMinPrice:1 withMaxPrice:5];

    [self addProduct:@"Candy" forCategory:@"Sporting Goods" withMinStock:0 withMaxStock:100 withMinPrice:1 withMaxPrice:5];

    [self addProduct:@"Candy" forCategory:@"Auto Parts" withMinStock:0 withMaxStock:100 withMinPrice:1 withMaxPrice:5];

    [self addProduct:@"Candy" forCategory:@"Consumer Electronics" withMinStock:0 withMaxStock:100 withMinPrice:1 withMaxPrice:5];
}

- (void)addTestStoresToDatabase
{
    NSArray* storeNames = @[@"Smarthome",
                            @"Marvac Electronics",
                            @"Alltech Electronics",
                            @"RPM Auto Parts",
                            @"Detailing",
                            @"Greddy Performance Products, Inc.",
                            @"MonkeySports Superstore",
                            @"Irvine Bicycles",
                            @"Lulumon Athletica",
                            @"PTR Games",
                            @"GameGeeks",
                            @"Alakazam Comics",
                            @"Master Vapor",
                            @"Vapor Labs",
                            @"Vape & Co.",
                            @"Lobby",
                            @"Kaitlyn Clothing",
                            @"Parc 81",
                            @"Love & Laundry Boutique",
                            @"Irvine Tennis",
                            @"Ace Auto Parts",
                            @"JK ELECTRONICS",
                            @"Up In Smoke",
                            @"Socal Gaming"];

    NSArray* storeWebsite = @[@"http://www.smarthome.com/_/index.aspx",
                              @"http://www.marvac.com/",
                              @"http://www.malltech.com/",
                              @"http://www.rpmautoparts.com/",
                              @"http://www.detailing.com/store/",
                              @"http://www.greddy.com/",
                              @"http://www.monkeysports.com/",
                              @"http://www.irvinebicycles.com/",
                              @"http://lululemon.com/irvine/irvine?cid=yelp",
                              @"http://ptrgames.com/",
                              @"N/A",
                              @"http://www.alakazamcomics.com/",
                              @"http://www.mastervaporoc.com/",
                              @"http://www.vaporlabsonline.com/",
                              @"http://www.vapeandco.com/",
                              @"http://www.lobbystoreonline.com/",
                              @"http://www.kaitlynclothing.com/shop/index.php",
                              @"http://www.bachrach.com/",
                              @"http://www.loveandlaundryboutique.com/index2.php#!/HELLO",
                              @"http://irvinetennis.com/",
                              @"http://www.aceautohb.com/",
                              @"http://www.jkelectronics.com/",
                              @"N/A",
                              @"http://www.socalgaming.com/"];

    NSArray* storeLatitude = @[@"33.694928",
                               @"33.647111",
                               @"33.726376",
                               @"33.679769",
                               @"33.632043",
                               @"33.649547",
                               @"33.700821",
                               @"33.668977",
                               @"33.648770",
                               @"33.788554",
                               @"33.776789",
                               @"33.650442",
                               @"33.691217",
                               @"33.666994",
                               @"33.707768",
                               @"33.677563",
                               @"33.650374",
                               @"33.651562",
                               @"33.636384",
                               @"33.690066",
                               @"33.672457",
                               @"33.760018",
                               @"33.620901",
                               @"33.665029"];

    NSArray* storeLongitude = @[@"-117.828921",
                                @"-117.919799",
                                @"-117.854077",
                                @"-117.903856",
                                @"-117.718771",
                                @"-117.713595",
                                @"-117.837503",
                                @"-117.765397",
                                @"-117.744689",
                                @"-117.816518",
                                @"-117.918777",
                                @"-117.838769",
                                @"-117.830689",
                                @"-117.749512",
                                @"-117.779255",
                                @"-117.886193",
                                @"-117.746065",
                                @"-117.745661",
                                @"-117.918816",
                                @"-117.770704",
                                @"-117.974605",
                                @"-118.016416",
                                @"-117.702236",
                                @"-117.746394"];

    NSArray* storeCategory = @[@"Consumer Electronics",
                               @"Consumer Electronics",
                               @"Consumer Electronics",
                               @"Auto Parts",
                               @"Auto Parts",
                               @"Auto Parts",
                               @"Sporting Goods",
                               @"Sporting Goods",
                               @"Sporting Goods",
                               @"Video Games",
                               @"Video Games",
                               @"Video Games",
                               @"Smoke Shops",
                               @"Smoke Shops",
                               @"Smoke Shops",
                               @"Clothing",
                               @"Clothing",
                               @"Clothing",
                               @"Clothing",
                               @"Sporting Goods",
                               @"Auto Parts",
                               @"Consumer Electronics",
                               @"Smoke Shops",
                               @"Video Games"];

    for (int i = 0; i < storeNames.count; i++)
    {
        PFObject *object = [PFObject objectWithClassName:@"Store"];
        object[@"name"] = storeNames[i];
        object[@"website"] = storeWebsite[i];
        PFGeoPoint *point = [PFGeoPoint geoPointWithLatitude:[storeLatitude[i] doubleValue] longitude:[storeLongitude[i] doubleValue]];
        object[@"location"] = point;
        object[@"type"] = storeCategory[i];
        [object saveInBackground];
    }
}

#pragma mark - TextField Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    cachedSearchString = textField.text;

    [textField resignFirstResponder];

    return YES;
}

#pragma mark - Segue Methods

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([searchTextField.text isEqualToString:@""])
    {
        return NO;
    }

    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SearchResultViewController* searchResultVC = segue.destinationViewController;
    searchResultVC.searchString = searchTextField.text;
    searchResultVC.navigationItem.title = [NSString stringWithFormat:@"Search Result: %@", searchTextField.text];
}

@end
