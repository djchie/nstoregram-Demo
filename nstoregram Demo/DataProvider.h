//
//  DataProvider.h
//  nstoregram Demo
//
//  Created by Dinh Ho on 6/30/14.
//  Copyright (c) 2014 Derrick J Chie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NSArrayBlock)(NSArray *obj, NSError *error);
typedef void (^NSDataBlock)(NSData *obj, NSError *error);

@interface DataProvider : NSObject

// DataProvider is a singleton object
+(instancetype)sharedInstance;

// these 2 methods may be buggy

- (void)queryProductByName:(NSString *)name
                completion:(NSArrayBlock)block;//__attribute__((deprecated("This search is buggy, it returns too many objects, we should use queryProductByNameContainsString")));
                                                             

- (void)queryAllProductsFromStore:(NSString *)store
                       completion:(NSArrayBlock)block; //__attribute__((deprecated("This search is buggy, it returns too many objects, we should use queryAllProductsFromStoreContainsString")));

- (void)queryStoreByCategory:(NSString *)name
               completion:(NSArrayBlock)block;

-(void)queryAllProductsFromStoreContainsString:(NSString *)store
                                    completion:(NSArrayBlock)block;

                                                             
                                                             // USE THESE METHODS FOR CONTAINS IN QUERY
-(void)queryProductByNameContainsString:(NSString *)name
                             completion:(NSArrayBlock)block;

-(void)queryStoryById:(NSString *)objectId
                             completion:(NSArrayBlock)block;

@end
