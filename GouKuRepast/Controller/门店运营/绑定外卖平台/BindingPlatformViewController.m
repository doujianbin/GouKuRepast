//
//  BindingPlatformViewController.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/8/13.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BindingPlatformViewController.h"
#import "WYWebProgressLayer.h"


@interface BindingPlatformViewController ()<UIWebViewDelegate>

@property (nonatomic ,strong)UIWebView          *myWebview;
@property (nonatomic ,strong)WYWebProgressLayer *progressLayer;


@end

@implementation BindingPlatformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.str_title;
}

- (void)onCreate{
    self.myWebview = [[UIWebView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight)];
    [self.view addSubview:self.myWebview];
    self.myWebview.delegate = self;
    [self.myWebview sizeToFit];
    NSURL *url = [NSURL URLWithString:self.str_Url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebview loadRequest:request];
    
    _progressLayer = [WYWebProgressLayer new];
    _progressLayer.frame = CGRectMake(0, 42, SCREEN_WIDTH, 2);
    [self.navigationController.navigationBar.layer addSublayer:_progressLayer];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    // starting the load, show the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [_progressLayer startLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // finished loading,hide the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [_progressLayer finishedLoad];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"%@ 错误",error);
    [_progressLayer finishedLoad];
}

- (void)leftBarAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    if (self.bindingPlatformComplete) {
        self.bindingPlatformComplete();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
