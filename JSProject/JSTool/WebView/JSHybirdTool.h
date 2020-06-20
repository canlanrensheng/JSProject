//
//  JSHybirdTool.h
//  JSProject
//
//  Created by 张金山 on 2020/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WebViewViewController;
NS_ASSUME_NONNULL_BEGIN

@protocol JSHybirdTool <NSObject>

- (void)doActionWithParams:(NSDictionary *)params
                            webView:(WKWebView *)webView
                              viewController:(WebViewViewController *)viewController
                                callback:(void(^)(NSError *error, id result))callback;

@end

NS_ASSUME_NONNULL_END
