//
//  ExampleTableController.m
//  TestTable
//
//  Created by Alexander on 04.12.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ExampleTableController.h"
#import "MyCell.h"

@interface TableItem : NSObject
@property (nonatomic, assign) BOOL on;
@property (nonatomic, strong) NSString *text;
@end

@implementation TableItem
@end


@interface ExampleTableController() <UITableViewDataSource, UITableViewDelegate, MyCellDelagate>
{
    NSMutableArray *tableData;
}
@property (nonatomic, weak) IBOutlet UITableView *table;
@end

@implementation ExampleTableController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.table.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    tableData = [NSMutableArray new];
    for (NSInteger i = 0; i < 10; i++) {
        TableItem *item = [TableItem new];
        item.text = [NSString stringWithFormat:@"dsfdsf sdf %ld", (long)i];
        [tableData addObject:item];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 10 == 0)
        return 5;
    else
        return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableData.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"fdsfsdsd ";
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 10 == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Separator"];
        return cell;
    }
    
    
    MyCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    TableItem *item = tableData[indexPath.row];
    cell.lab.text = item.text;
    cell.switchElem.on = item.on;
    cell.delegate = self;
    
    return cell;
}

- (void)switchChanged:(MyCell *)cell
{
    NSIndexPath *path = [self.table indexPathForCell:cell];
    TableItem *item = tableData[path.row];
    item.on = cell.switchElem.isOn;
    [self.table reloadData];
}

@end
