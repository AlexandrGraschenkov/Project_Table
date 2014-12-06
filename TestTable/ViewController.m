//
//  ViewController.m
//  TestTable
//
//  Created by Alexander on 04.12.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
{}

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIView *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self initalizeScrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect frame = self.headerView.frame;
    frame.origin.y = scrollView.contentOffset.y;
    self.headerView.frame = frame;
}

- (void)initalizeScrollView
{
    float labHeight = 30;
    int count = 40;
    for (NSInteger i = 0; i < count; i++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, i*labHeight, self.scrollView.frame.size.width, labHeight)];
        lab.text = [NSString stringWithFormat:@"Lab %ld", (long)i];
        [self.scrollView addSubview:lab];
    }
    self.scrollView.contentSize = CGSizeMake(10, count * labHeight);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
}


#pragma mark - Keyboard

- (void)keyboardWasShown:(NSNotification *)notification {
    NSDictionary* info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0f, 0.0f, kbSize.height, 0.0f);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

@end
