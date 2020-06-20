//
//  JSWebViewBridge.h
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
@class WebViewViewController;
NS_ASSUME_NONNULL_BEGIN

@interface JSWebViewJavascriptBridge : NSObject<WKScriptMessageHandler>

- (instancetype)initWithWebView:(WKWebView *)webView viewController:(WebViewViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
