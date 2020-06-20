//
//  WebViewViewController.m
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "WebViewViewController.h"
#import <WebKit/WebKit.h>
#import "JSWebViewJavascriptBridge.h"
#import "JSWebViewUserAgent.h"


@interface WebViewViewController ()

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation WebViewViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [JSWebViewUserAgent updateUserAgent];
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    __weak typeof(self) wself = self;
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(wself.view).insets(UIEdgeInsetsMake(Height_NavBar, 0, 0, 0));
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.webView.mas_top);
        make.left.right.mas_equalTo(wself.webView);
        make.height.mas_equalTo(2);
    }];
    
    [self addObservers];
}

- (void)setCommonUrl:(NSString *)commonUrl {
    _commonUrl = commonUrl;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:commonUrl]];
    NSDictionary *headFields = request.allHTTPHeaderFields;
    NSString *cookie = headFields[@"Invite-Token"];
    
    //token放入wkwebview的cookie中，以后wkwebview可以同步原生app的登陆状态
    //iOS 8
//    if (cookie == nil) {
//        NSString *token = [UserInfoManager shareInstance].token;
//        [request addValue:[NSString stringWithFormat:@"Invite-Token=%@", token] forHTTPHeaderField:@"Cookie"];
//    }
    [self.webView loadRequest:request];
}

- (void)mtPopToPreviousViewController {
    if (self.webView.canGoBack) {
        [self.webView goBack];
    } else {
        [self.webView reload];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)clickedRule {
//    NSString *jsStr = [NSString stringWithFormat:@"%@()", self.nModel.rightFunction];
//    [self.webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
//        NSLog(@"%@----%@",result, error);
//    }];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.webView.configuration.userContentController removeAllUserScripts];
}


//webView
- (WKWebView *)webView {
    if (!_webView) {
        JSWebViewJavascriptBridge *weakScript = [[JSWebViewJavascriptBridge alloc] initWithWebView:_webView viewController:self];
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        WKUserContentController *userContentController = WKUserContentController.new;
        //token同步登陆的状态 iOS 10
        NSString *cookieSource = [NSString stringWithFormat:@"document.cookie = 'Invite-Token=%@';", @""];
        WKUserScript *cookieScript = [[WKUserScript alloc] initWithSource:cookieSource injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
        [userContentController addUserScript:cookieScript];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"WebViewJavascriptBridgeList" ofType:@".plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
        if(array.count > 0) {
            for (NSDictionary *dict in array) {
                NSString *name = [dict safeStringValueForKey:@"name" defaultValue:@""];
                [userContentController addScriptMessageHandler:weakScript name:name];
            }
        }
        config.userContentController = userContentController;
        _webView = [[NSClassFromString(@"WKWebView") alloc] initWithFrame:CGRectZero configuration:config];
        if (@available(iOS 11.0, *)) {
            _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _webView;
}

//进度条
- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectZero];
        _progressView.trackTintColor = UIColor.clearColor;
        _progressView.tintColor = MainColor;
        _progressView.progress = 0.05;
        _progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    }
    return _progressView;
}

#pragma mark - Observers
- (void)addObservers {
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
}


- (void)removeObservers {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeObserver:self forKeyPath:@"title"];
}

//KVO 监听进度条和标题的展示
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (object == _webView) {
        if([keyPath isEqualToString:@"estimatedProgress"]){
            [self updateProgressViewWithProgress:_webView.estimatedProgress];
        }else if ([keyPath isEqualToString:@"title"]){
            self.navigationItem.title = _webView.title;
        }
    }
}


- (void)updateProgressViewWithProgress:(float)progress {
    self.progressView.progress = progress;
    if (self.progressView.progress == 1) {
        __weak typeof (self)wself = self;
        [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
            wself.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
        } completion:^(BOOL finished) {
            wself.progressView.hidden = YES;
        }];
    }
}

- (void)dealloc {
    [self.webView.configuration.userContentController removeAllUserScripts];
    [self removeObservers];
}


@end
