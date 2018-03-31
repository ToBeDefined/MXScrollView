//
//  EasyUseViewController.m
//  MXScrollViewDemo
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 PRO. All rights reserved.
//

#import "EasyUseViewController.h"
#import "MXScrollView.h"

#define Screen_Width [UIScreen mainScreen].bounds
static CGFloat const scrollViewWidth = 300;
static CGFloat const scrollViewHeight = 200;

@interface EasyUseViewController ()
{
    MXImageScrollView *scroll;
}
@end

@implementation EasyUseViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [scroll invalidateTimer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    scroll = [[MXImageScrollView alloc] initWithFrame:CGRectMake((CGRectGetWidth(Screen_Width) - scrollViewWidth) / 2,
                                                                 scrollViewHeight,
                                                                 scrollViewWidth,
                                                                 scrollViewHeight)
                                downloadImageFunction:nil];
    scroll.images = @[[UIImage imageNamed:@"picture_1"],
                      [UIImage imageNamed:@"picture_2"],
                      [UIImage imageNamed:@"picture_3"]];
    [scroll setTapImageHandle:^(NSInteger index) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:[NSString
                                                                     stringWithFormat:@"你点击了%ld张图片", (long)index]
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"Ok", nil];
        [alertView show];
    }];
    
    [scroll setDidScrollImageViewAtIndexHandle:^(NSInteger index) {
        NSLog(@"滑动到了第%ld页", (long)index);
    }];
    
    [self.view addSubview:scroll];
}

@end
