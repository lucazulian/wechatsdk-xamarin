//
//  SendMsgToWeChatViewController.h
//  ApiClient
//
//  Created by Tencent on 12-2-27.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApiObject.h"

@protocol sendMsgToWeChatViewDelegate <NSObject>
- (void) changeScene:(NSInteger)scene;
- (void) sendTextContent;
- (void) sendImageContent;
- (void) sendLinkContent;
- (void) sendMusicContent;
- (void) sendVideoContent;
- (void) sendAppContent;
- (void) sendNonGifContent;
- (void) sendGifContent;
- (void) sendAuthRequest;
- (void) sendFileContent;
@end

@interface SendMsgToWeChatViewController : UIViewController {
    UIButton *sendNonGIFBtn;
    UIButton *sendGIFBtn;
    
    UIButton *oAuthBtn;
    UIButton *sendFileBtn;
}

@property (nonatomic, assign) id<sendMsgToWeChatViewDelegate,NSObject> delegate;

@end
