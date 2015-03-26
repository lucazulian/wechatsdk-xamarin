//
//  SendMsgToWechatMgr.h
//  SDKSample
//
//  Created by Tencent on 6/23/13.
//
//

#import <Foundation/Foundation.h>

#import "WXApi.h"
#import "SendMsgToWeChatViewController.h"
#import "RespForWeChatViewController.h"

@interface SendMsgToWechatMgr : NSObject <sendMsgToWeChatViewDelegate,
UIAlertViewDelegate, WXApiDelegate, RespForWeChatViewDelegate>
{
    enum WXScene _scene;
}

@property (nonatomic, assign) UIViewController *viewController;

@end
