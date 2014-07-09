//
//  DataProvider.m
//  nstoregram Demo
//
//  Created by Dinh Ho on 6/30/14.
//  Copyright (c) 2014 Derrick J Chie. All rights reserved.
//

#import "DataProvider.h"
#import <Parse/Parse.h>


@implementation DataProvider

+ (instancetype)sharedInstance
{
    static DataProvider *sharedManagerInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManagerInstance = [[DataProvider alloc] init];
    });
	return sharedManagerInstance;
}

// these methods may be buggy
- (void)queryProductByName:(NSString *)name
               completion:(NSArrayBlock)block
{
    // NOTE:: this will be slow for large dataset, see parse documentation
    // the matchesRegex query allows us to query with caseinsensitivity:
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query whereKey:@"name" matchesRegex:name modifiers:@"i"];
    //[query whereKey:@"name" containsString:name];
    [query findObjectsInBackgroundWithBlock:block];
}

- (void)queryAllProductsFromStore:(NSString *)store completion:(NSArrayBlock)block
{
    // NOTE:: this will be slow for large dataset, see parse documentation
    // the matchesRegex query allows us to query with caseinsensitivity:
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query whereKey:@"store_name" matchesRegex:store modifiers:@"i"];
    [query findObjectsInBackgroundWithBlock:block];
}

- (void)queryAllProductsWithCompletion:(NSArrayBlock)block
{
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query setLimit:150];
    [query findObjectsInBackgroundWithBlock:block];
}

// USE THESE METHODS FOR CONTAINS IN QUERY
-(void)queryProductByNameContainsString:(NSString *)name completion:(NSArrayBlock)block
{
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query whereKey:@"name"containsString:name];
    //[query whereKey:@"name" containsString:name];
    [query findObjectsInBackgroundWithBlock:block];
}


-(void)queryAllProductsFromStoreContainsString:(NSString *)store completion:(NSArrayBlock)block
{
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query whereKey:@"store_name" containsString:store];
    [query findObjectsInBackgroundWithBlock:block];
}

- (void)queryStoreByCategory:(NSString *)category completion:(NSArrayBlock)block
{
    PFQuery *query = [PFQuery queryWithClassName:@"Store"];
    [query whereKey:@"type" equalTo:category];
    [query findObjectsInBackgroundWithBlock:block];
}


- (void)queryStoryById:(NSString *)objectId completion:(NSArrayBlock)block
{
    PFQuery *query = [PFQuery queryWithClassName:@"Store"];
    [query whereKey:@"objectId" equalTo:objectId];
    [query findObjectsInBackgroundWithBlock:block];
}

@end
