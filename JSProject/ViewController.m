//
//  ViewController.m
//  JSProject
//
//  Created by 张金山 on 2020/6/17.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "ViewController.h"
#import "DebugConsoleViewController.h"

#import "WebViewViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Home";
    self.view.backgroundColor = BackGroundColor;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    tap.numberOfTapsRequired = 6;
    [self.view addGestureRecognizer:tap];
}

- (void)tapClick {
    DebugConsoleViewController *textVC = [[DebugConsoleViewController alloc] init];
    [self.navigationController pushViewController:textVC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    WebViewViewController *webViewVC = [[WebViewViewController alloc] init];
    webViewVC.commonUrl = @"http://www.baidu.com";
    [self.navigationController pushViewController:webViewVC animated:YES];
}

@end
