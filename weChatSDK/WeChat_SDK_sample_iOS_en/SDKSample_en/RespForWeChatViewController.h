//
//  RespForWeChatViewController.h
//  SDKSample
//
//  Created by Tencent on 12-4-9.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RespForWeChatViewDelegate <NSObject>
- (void) RespTextContent;
- (void) RespImageContent;
- (void) RespLinkContent;
- (void) RespMusicContent;
- (void) RespVideoContent;
- (void) RespAppContent;
- (void) RespNonGifContent;
- (void) RespGifContent;
- (void) RespFileContent;
@end

@interface RespForWeChatViewController : UIViewController

@property (nonatomic, assign) id<RespForWeChatViewDelegate,NSObject> delegate;

@end
