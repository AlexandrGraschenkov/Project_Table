//
//  MyCell.h
//  TestTable
//
//  Created by Alexander on 04.12.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyCell;
@protocol MyCellDelagate <NSObject>
- (void)switchChanged:(MyCell *)cell;
@end


@interface MyCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *lab;
@property (nonatomic, weak) IBOutlet UISwitch *switchElem;
@property (nonatomic, weak) id<MyCellDelagate> delegate;

@end