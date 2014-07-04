//
//  ProductResultTableViewCell.h
//  nstoregram Demo
//
//  Created by Dinh Ho on 7/3/14.
//  Copyright (c) 2014 Derrick J Chie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductResultTableViewCell : UITableViewCell

// outlets
// image view(s)
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

// labels
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *store;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *quantity;

// textview
@property (weak, nonatomic) IBOutlet UITextView *shortDescription;

@property(nonatomic, assign)BOOL imageIsSet;


@end
