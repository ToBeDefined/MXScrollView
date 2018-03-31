//
//  ViewController.m
//  CMCyclicScrollDemo
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 desn. All rights reserved.
//

#import "ViewController.h"
#import "EasyUseViewController.h"
#import "TableUseViewController.h"
#import "VerticalUseViewController.h"
#import "AnimationViewController.h"
#import "DownloadImgaeViewController.h"

static NSString *const tableIdentifier = @"TableViewCell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray <Class> *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBaseData];
}

- (void)initBaseData {
    self.title = @"MXScrollView";
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                      NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
    
    self.dataArray = @[[EasyUseViewController class],
                       [TableUseViewController class],
                       [VerticalUseViewController class],
                       [AnimationViewController class],
                       [DownloadImgaeViewController class]];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableIdentifier];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - tabelView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier forIndexPath:indexPath];
    cell.textLabel.text = NSStringFromClass(self.dataArray[indexPath.row]);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class vcClass = self.dataArray[indexPath.row];
    UIViewController *viewController = [[vcClass alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
