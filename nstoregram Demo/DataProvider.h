//
//  DataProvider.h
//  nstoregram Demo
//
//  Created by Dinh Ho on 6/30/14.
//  Copyright (c) 2014 Derrick J Chie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NSArrayBlock)(NSArray *obj, NSError *error);
@interface DataProvider : NSObject

// DataProvider is a singleton object
+(instancetype)sharedInstance;

- (void)queryProductByName:(NSString *)name
               completion:(NSArrayBlock)block;

- (void)queryAllProductsFromStore:(NSString *)store
                      completion:(NSArrayBlock)block;

- (void)queryStoreByCategory:(NSString *)name
               completion:(NSArrayBlock)block;

@end
