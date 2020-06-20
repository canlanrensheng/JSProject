//
//  JSWebViewBridge.m
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "JSWebViewJavascriptBridge.h"
#import "JSHybirdTool.h"

@interface JSWebViewJavascriptBridge ()

@property(nonatomic,strong)NSMutableArray *hybirdTools;
@property(nonatomic,strong)WKWebView *webView;
@property(nonatomic,strong)WebViewViewController *webViewController;

@end

@implementation JSWebViewJavascriptBridge

- (NSMutableArray *)hybirdTools {
    if(!_hybirdTools) {
        _hybirdTools = [NSMutableArray array];
    }
    return _hybirdTools;
}

- (instancetype)initWithWebView:(WKWebView *)webView viewController:(WebViewViewController *)viewController {
    if (self = [super init]) {
      _webView = webView;
      _webViewController = viewController;
      //匹配的数据源
      NSString *filePath = [[NSBundle mainBundle] pathForResource:@"WebViewJavascriptBridgeList" ofType:@".plist"];
      NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
      if(array.count > 0) {
          [self.hybirdTools addObjectsFromArray:array];
     }
   }
    return self;
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if(self.hybirdTools.count <= 0) {
        return;
    }
    for (NSDictionary *dict in self.hybirdTools) {
        NSString *funcName = [dict safeStringValueForKey:@"name" defaultValue:@""];
        NSString *funcClassName = [dict safeStringValueForKey:@"class" defaultValue:@""];
        if([message.name isEqualToString:funcName]) {
            Class funcClass = NSClassFromString(funcClassName);
            if(funcClass == nil) {
                return;
            }
            id<JSHybirdTool> tool = [[funcClass alloc] init];
            //js调用原生
            @weakify(self)
            [tool doActionWithParams:message.body webView:self.webView viewController:self.webViewController callback:^(NSError * _Nonnull error, id  _Nonnull result) {
                @strongify(self)
                if (error) {
                    
                } else {
                    
                }
            }];
            break;
        }
    }
}

//原生传递参数给js
- (void)actionDidFinishWithMessageId:(id)mId error:(id)error result:(id)result {
    NSArray *args = @[mId, (error ?: [NSNull null]), (result ?: [NSNull null])];
    [self callJSFunc:@"" withArgs:args];
}

- (void)callJSFunc:(NSString *)funcName withArgs:(NSArray *)args {
    NSMutableString *js = funcName.mutableCopy;
    [js appendString:@"("];
    NSMutableArray *values = @[].mutableCopy;
    [args enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        NSString *value = @"";
        if ([obj isKindOfClass:[NSString class]]) {
            value = [self javaScriptStringEncodeValue:obj];
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            value = [NSString stringWithFormat:@"%@", obj];
        } else if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSDictionary class]]) {
            value = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:obj options:0 error:nil]
                                          encoding:NSUTF8StringEncoding];
        } else if ([obj isKindOfClass:[NSNull class]]) {
            value = @"null";
        }
        [values addObject:value];
    }];
    [js appendString:[values componentsJoinedByString:@","]];
    [js appendString:@")"];
    [self.webView evaluateJavaScript:js completionHandler:nil];
}

- (NSString *)javaScriptStringEncodeValue:(NSString *)value {
    NSMutableString *result = value.mutableCopy;
    [result replaceOccurrencesOfString:@"\\" withString:@"\\\\" options:0 range:NSMakeRange(0, result.length)];
    [result replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:0 range:NSMakeRange(0, result.length)];
    [result replaceOccurrencesOfString:@"\n" withString:@"\\n" options:0 range:NSMakeRange(0, result.length)];
    [result replaceOccurrencesOfString:@"\r" withString:@"\\r" options:0 range:NSMakeRange(0, result.length)];
    [result replaceOccurrencesOfString:@"\f" withString:@"\\f" options:0 range:NSMakeRange(0, result.length)];
    [result replaceOccurrencesOfString:@"\u2028" withString:@"\\u2028" options:0 range:NSMakeRange(0, result.length)];
    [result replaceOccurrencesOfString:@"\u2029" withString:@"\\u2029" options:0 range:NSMakeRange(0, result.length)];
    return [NSString stringWithFormat:@"\"%@\"", result];
}

@end
