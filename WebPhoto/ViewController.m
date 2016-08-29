//
//  ViewController.m
//  WebPhoto
//
//  Created by 韩新辉 on 16/8/29.
//  Copyright © 2016年 韩新辉. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate = self;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image.html" ofType:nil];
    NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@",path]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:webView];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString *imagePath = [[NSBundle mainBundle] resourcePath];
    
    // 加载本地图片，这里在Documents内放入一张图片
//    NSString * imgpath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/image/8.jpg"]];
//    imagePath = [NSString stringWithFormat:@"file://%@",imgpath];
//    
//    NSLog(@"imagePath  %@",imgpath);

    //加载工程内的图片
    imagePath = [imagePath stringByReplacingOccurrencesOfString:@"/" withString:@"//"];
    imagePath = [NSString stringWithFormat:@"file:/%@//%@",imagePath,@"home.jpg"];
    
    //注入js
    NSString * js = [NSString stringWithFormat:@"document.images[0].src='%@'",imagePath];
    [webView stringByEvaluatingJavaScriptFromString:js];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
