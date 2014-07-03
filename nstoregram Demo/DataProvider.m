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

+(instancetype)sharedInstance
{
    static DataProvider *sharedManagerInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManagerInstance = [[DataProvider alloc] init];
    });
	return sharedManagerInstance;
}

-(void)queryProductByName:(NSString *)name
               completion:(NSArrayBlock)block
{
    // NOTE:: this will be slow for large dataset, see parse documentation
    // the matchesRegex query allows us to query with caseinsensitivity:
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query whereKey:@"name" matchesRegex:name modifiers:@"i"];
    //[query whereKey:@"name" containsString:name];
    [query findObjectsInBackgroundWithBlock:block];
}

-(void)queryAllProductsFromStore:(NSString *)store completion:(NSArrayBlock)block
{
    // NOTE:: this will be slow for large dataset, see parse documentation
    // the matchesRegex query allows us to query with caseinsensitivity:
    PFQuery *query = [PFQuery queryWithClassName:@"Product"];
    [query whereKey:@"store_name" matchesRegex:store modifiers:@"i"];
    [query findObjectsInBackgroundWithBlock:block];
}

-(void)queryStoreByCategory:(NSString *)category completion:(NSArrayBlock)block
{
    PFQuery *query = [PFQuery queryWithClassName:@"Store"];
    [query whereKey:@"category" matchesRegex:category modifiers:@"i"];
    [query findObjectsInBackgroundWithBlock:block];
}


@end
