//
//  MainViewController.m
//  VisualDemo
//
//  Created by 今代科技 on 2017/9/1.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "MainViewController.h"
#import "UIToolbarViewController.h"
#import "UIVisualViewController.h"
#import "CoreImageVc.h"
#import "VimageVc.h"

static NSString * const CELL_IDENTI = @"CELL_IDENTI";
@interface MainViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray    * dataArr;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_IDENTI];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTI forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIToolbarViewController * vc = [[UIToolbarViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1) {
        UIVisualViewController * vc = [[UIVisualViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2) {
        CoreImageVc * vc = [[CoreImageVc alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 3) {
        VimageVc * vc = [[VimageVc alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@"UIToolbar",@"UIVisualEffectView",@"Core Image",@"vImage"];
    }
    return _dataArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
