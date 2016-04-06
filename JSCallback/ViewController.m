//
//  ViewController.m
//  JSCallback
//
//  Created by DannyYang on 2016/4/6.
//  Copyright © 2016年 DannyYang. All rights reserved.
//

/*
 * 請在瀏覽器Console上執行:
 * JSBridge.execWithCallback("123",function(res){ alert(res);});
 *
 */

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController {
    JSContext *jsContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* url = @"https://www.google.com.tw";
    
    NSURL* nsUrl = [NSURL URLWithString:url];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [self.webView loadRequest:request];
    [self.webView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - webView delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    jsContent = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];;
    jsContent[@"JSBridge"] = self;
}

#pragma mark - JSBridgeJSExport
- (void)exec:(NSString *)data withCallback:(JSValue *)callback {
    NSLog(@"input data : %@",data);
    NSString *returnValue = [NSString stringWithFormat:@"Your input data is : %@",data];
    [callback callWithArguments:@[returnValue]];
}

@end
