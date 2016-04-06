//
//  ViewController.h
//  JSCallback
//
//  Created by DannyYang on 2016/4/6.
//  Copyright © 2016年 DannyYang. All rights reserved.
//

#import <UIKit/UIKit.h>
@import JavaScriptCore;


@protocol JSBridgeJSExport <JSExport>
- (void)exec:(NSString *)data;
- (void)exec:(NSString *)data withCallback:(JSValue *)callback ;
@end

@interface ViewController : UIViewController<UIWebViewDelegate,JSBridgeJSExport>


@end

