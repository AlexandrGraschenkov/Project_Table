//
//  MyCell.m
//  TestTable
//
//  Created by Alexander on 04.12.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell


- (IBAction)switchChanged:(id)sender
{
    [self.delegate switchChanged:self];
}

@end
