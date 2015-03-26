//
//  AppDelegate.h
//  ApiClient
//
//  Created by Tencent on 12-2-27.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"
#import "SendMsgToWechatMgr.h"
#import "SendMsgToWeChatViewController.h"
#import "RespForWeChatViewController.h"

@interface AppDelegate : UIResponder<UIApplicationDelegate, WXApiDelegate>
{
    enum WXScene _scene;
    SendMsgToWechatMgr *_sendMsgToWechatMgr;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SendMsgToWeChatViewController *viewController;

@end
