//
//  ViewController.m
//  Test
//
//  Created by Crazy Wang on 2018/11/12.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//

#import "ViewController.h"
#import "WSQAdaptiveLable.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    WSQAdaptiveLable *lab = [[WSQAdaptiveLable alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 200) tagArray:[NSMutableArray arrayWithArray:@[@"wwwwww",@"qqqqqqq",@"qqqqqqqffffffffff",@"qqqgggggggqqqq",@"qqqqqqqwwwww",@"ssssd",@"qqqqqqqffffffffff",@"qqqgggggggqqqq",@"qqqqqqqwwwww"]] andType:WSQAdaptiveLableTypeLeft andSingleOrMultiple:WSQAdaptiveLableMultiple];
    
//    lab.btnH = 30.0;
//    lab.textColorSelected = [UIColor colorWithRed:46/255.0 green:197/255.0 blue:204/255.0 alpha:1];
//    lab.textColorNormal = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
//    lab.backgroundColorSelected = [UIColor whiteColor];
//    lab.backgroundColorNormal = [UIColor whiteColor];
//    lab.borderColorSelected = [UIColor colorWithRed:46/255.0 green:197/255.0 blue:204/255.0 alpha:1];
//    lab.borderColorNormal = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    NSLog(@"lab.selfHeight:%f",lab.selfHeight);
   
    lab.frame = CGRectMake(0, 100, self.view.frame.size.width, lab.selfHeight);
    lab.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lab];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
