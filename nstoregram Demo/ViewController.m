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

    [self addTestProductsToDatabase];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                            @"Parc 81"];

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
                              @"http://www.bachrach.com/"];

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
                               @"33.651562"];

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
                                @"-117.745661"];

    for (int i = 0; i < storeNames.count; i++)
    {
        PFObject *object = [PFObject objectWithClassName:@"Store"];
        object[@"name"] = storeNames[i];
        object[@"website"] = storeWebsite[i];
        PFGeoPoint *point = [PFGeoPoint geoPointWithLatitude:[storeLatitude[i] doubleValue] longitude:[storeLongitude[i] doubleValue]];
        object[@"location"] = point;
        [object saveInBackground];
    }
}

- (void)addTestProductsToDatabase
{
    /*
    NSString* storeName = @"";

    NSString* storeId = @"";

    NSString* category = @"";

    NSArray* productNames = @[@"",
                              @"",
                              @"",
                              @"",
                              @""];

    NSArray* productShortDescriptions = @[@"",
                                          @"",
                                          @"",
                                          @"",
                                          @""];

    NSArray* productStocks = @[@"",
                               @"",
                               @"",
                               @"",
                               @""];

    NSArray* productPrices = @[@"",
                               @"",
                               @"",
                               @"",
                               @""];
     */

//    NSString* storeName = @"PTR Games";
//
//    NSString* storeId = @"dgAeP6M05u";
//
//    NSString* category = @"Video Games";
//
//    NSArray* productNames = @[@"",
//                              @"",
//                              @"",
//                              @"",
//                              @""];
//
//    NSArray* productShortDescriptions = @[@"",
//                                          @"",
//                                          @"",
//                                          @"",
//                                          @""];
//
//    NSArray* productStocks = @[@12,
//                               @9,
//                               @6,
//                               @11,
//                               @2];
//
//    NSArray* productPrices = @[@18.00,
//                               @25.00,
//                               @58.00,
//                               @28.00,
//                               @118.00];
//
//
//    for (int i = 0; i < 5; i++)
//    {
//        PFObject *object = [PFObject objectWithClassName:@"Product"];
//        object[@"store_name"] = storeName;
//        object[@"store_id"] = storeId;
//        object[@"category"] = category;
//        object[@"name"] = productNames[i];
//        object[@"short_description"] = productShortDescriptions[i];
//        object[@"stock"] = productStocks[i];
//        object[@"price"] = productPrices[i];
//
//        [object saveInBackground];
//    }
}

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
            for (PFObject *object in obj)
            {
                NSLog(@"name of object %@", object[@"name"]);

                PFObject *object = [PFObject objectWithClassName:@"Product"];
                object[@"store_name"] = object[@"name"];
                object[@"store_id"] = object[@"objectId"];
                object[@"category"] = productCategory;
                object[@"name"] = productName;
                object[@"short_description"] = [NSString stringWithFormat:@"This %@ is available exclusively at %@.", productName, object[@"name"]];
                object[@"stock"] = @((arc4random() % (maxStock + 1)) + minStock);
                object[@"price"] = @((arc4random() % (maxPrice + 1)) + minPrice);
                
                [object saveInBackground];
            }
        }
    };

    [[DataProvider sharedInstance] queryStoreByCategory:productCategory completion:block];

}

@end
