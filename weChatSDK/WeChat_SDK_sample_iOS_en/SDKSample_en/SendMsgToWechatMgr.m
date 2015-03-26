//
//  SendMsgToWechatMgr.m
//  SDKSample
//
//  Created by Tencent on 6/23/13.
//
//

#import "SendMsgToWechatMgr.h"

@implementation SendMsgToWechatMgr

-(void) changeScene:(NSInteger)scene
{
    _scene = scene;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1000) {
        RespForWeChatViewController* controller = [[RespForWeChatViewController alloc] autorelease];
        controller.delegate = self;
        [self.viewController presentModalViewController:controller animated:YES];
    }
}

-(void) onReq:(BaseReq*)req
{
    if([req isKindOfClass:[GetMessageFromWXReq class]])
    {
        
        NSString *strTitle = [NSString stringWithFormat:@"WeChat request app contenct"];
        NSString *strMsg = @"WeChat requests content from App, and the App reponses WeChat by calling sendResp:GetMessageFromWXResp";
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alert.tag = 1000;
        [alert show];
        [alert release];
    }
    else if([req isKindOfClass:[ShowMessageFromWXReq class]])
    {
        ShowMessageFromWXReq* temp = (ShowMessageFromWXReq*)req;
        WXMediaMessage *msg = temp.message;
        
        WXAppExtendObject *obj = msg.mediaObject;
        
        NSString *strTitle = [NSString stringWithFormat:@"Message from WeChat"];
        NSString *strMsg = [NSString stringWithFormat:@"Title: %@ \nContent:%@ \nDescription: %@ \nThumb: %u bytes\n\n",msg.title, msg.description, obj.extInfo, msg.thumbData.length];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    else if([req isKindOfClass:[LaunchFromWXReq class]])
    {
        
        NSString *strTitle = [NSString stringWithFormat:@"Launched by WeChat"];
        NSString *strMsg = @"This message is from the App when started in WeChat";
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
}

-(void) onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        NSString *strTitle = resp.errCode ? @"Error" : @"Success";
        NSString *strError = @"There was an issue sharing your message. Please try again.";
        NSString *strSuccess = @"Your message was successfully shared!";
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle
                                                        message:resp.errCode ? strError : strSuccess
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
}

- (void) sendTextContent
{
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.text = @"Beneath it were the words: Stay Hungry. Stay Foolish. It was their farewell message as they signed off. Stay Hungry. Stay Foolish.";
    req.bText = YES;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespTextContent
{
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.text = @"Beneath it were the words: Stay Hungry. Stay Foolish. It was their farewell message as they signed off. Stay Hungry. Stay Foolish.";
    resp.bText = YES;
    
    [WXApi sendResp:resp];
}

- (void) sendImageContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res1thumb.png"]];
    
    WXImageObject *ext = [WXImageObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    ext.imageData = [NSData dataWithContentsOfFile:filePath];
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

- (void) RespImageContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res1thumb.png"]];
    WXImageObject *ext = [WXImageObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res1" ofType:@"jpg"];
    ext.imageData = [NSData dataWithContentsOfFile:filePath];
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void) sendLinkContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"Acer Aspire P3 review: a nice enough tablet, but wait for the refresh";
    message.description = @"Back when Windows 8 first launched, the Acer Iconia W700 quickly became one of our favorite laptop / tablet hybrids. There were two reasons for that, really: the price was right, and the battery lasted longer than pretty much any other Win 8 device we'd tested. ";
    [message setThumbImage:[UIImage imageNamed:@"Engadget.png"]];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = @"http://www.engadget.com/2013/06/22/acer-aspire-p3-review/";
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespLinkContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"Acer Aspire P3 review: a nice enough tablet, but wait for the refresh";
    message.description = @"Back when Windows 8 first launched, the Acer Iconia W700 quickly became one of our favorite laptop / tablet hybrids. There were two reasons for that, really: the price was right, and the battery lasted longer than pretty much any other Win 8 device we'd tested. ";;
    [message setThumbImage:[UIImage imageNamed:@"Engadget.png"]];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = @"http://www.engadget.com/2013/06/22/acer-aspire-p3-review/";
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

-(void) sendMusicContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"A Voice for You!";
    message.description = @"WeChat Voice";
    [message setThumbImage:[UIImage imageNamed:@"wechatMsg_cat.jpg"]];
    WXMusicObject *ext = [WXMusicObject object];
    ext.musicUrl = @"http://voice.wechat.com/kitty.mp3";
    ext.musicDataUrl = @"http://voice.wechat.com/kitty.mp3";
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespMusicContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"A Voice for You!";
    message.description = @"WeChat Voice";
    [message setThumbImage:[UIImage imageNamed:@"wechatMsg_cat.jpg"]];
    WXMusicObject *ext = [WXMusicObject object];
    ext.musicUrl = @"http://voice.wechat.com/kitty.mp3";
    ext.musicDataUrl = @"http://voice.wechat.com/kitty.mp3";
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

-(void) sendVideoContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"Steve Jobs";
    message.description = @"Stay hungry, stay foolish.";
    [message setThumbImage:[UIImage imageNamed:@"res7.jpg"]];
    
    WXVideoObject *ext = [WXVideoObject object];
    ext.videoUrl = @"http://www.youtube.com/watch?v=UF8uR6Z6KLc";
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespVideoContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"Steve Jobs";
    message.description = @"Stay hungry, stay foolish.";
    [message setThumbImage:[UIImage imageNamed:@"res7.jpg"]];
    
    WXVideoObject *ext = [WXVideoObject object];
    ext.videoUrl = @"http://www.youtube.com/watch?v=UF8uR6Z6KLc";
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

#define BUFFER_SIZE 1024 * 100
- (void) sendAppContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"App Message";
    message.description = @"Please install the app first.";
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    
    WXAppExtendObject *ext = [WXAppExtendObject object];
    ext.extInfo = @"<xml>extend info</xml>";
    ext.url = @"http://weixin.qq.com";
    
    Byte* pBuffer = (Byte *)malloc(BUFFER_SIZE);
    memset(pBuffer, 0, BUFFER_SIZE);
    NSData* data = [NSData dataWithBytes:pBuffer length:BUFFER_SIZE];
    free(pBuffer);
    
    ext.fileData = data;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespAppContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"App Message";
    message.description = @"Please install the app first.";
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    
    WXAppExtendObject *ext = [WXAppExtendObject object];
    ext.extInfo = @"<xml>extend info</xml>";
    ext.url = @"http://weixin.qq.com";
    
    Byte* pBuffer = (Byte *)malloc(BUFFER_SIZE);
    memset(pBuffer, 0, BUFFER_SIZE);
    NSData* data = [NSData dataWithBytes:pBuffer length:BUFFER_SIZE];
    free(pBuffer);
    
    ext.fileData = data;
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void) sendNonGifContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res5thumb.png"]];
    
    WXEmoticonObject *ext = [WXEmoticonObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res5" ofType:@"jpg"];
    ext.emoticonData = [NSData dataWithContentsOfFile:filePath];
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

- (void)RespNonGifContent{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res5thumb.png"]];
    
    WXEmoticonObject *ext = [WXEmoticonObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res5" ofType:@"jpg"];
    ext.emoticonData = [NSData dataWithContentsOfFile:filePath];
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void) sendGifContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res6thumb.png"]];
    
    WXEmoticonObject *ext = [WXEmoticonObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
    ext.emoticonData = [NSData dataWithContentsOfFile:filePath] ;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

- (void)RespGifContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res6thumb.png"]];
    WXEmoticonObject *ext = [WXEmoticonObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
    ext.emoticonData = [NSData dataWithContentsOfFile:filePath] ;
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void) RespEmoticonContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res5thumb.png"]];
    WXEmoticonObject *ext = [WXEmoticonObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res5" ofType:@"jpg"];
    ext.emoticonData = [NSData dataWithContentsOfFile:filePath];
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void)sendFileContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"Test.xml";
    message.description = @"Test";
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    
    WXFileObject *ext = [WXFileObject object];
    ext.fileExtension = @"xml";
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"xml"];
    ext.fileData = [NSData dataWithContentsOfFile:filePath];
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

- (void)RespFileContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"ML.pdf";
    message.description = @"Mechine Learning";
    [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
    
    WXFileObject *ext = [WXFileObject object];
    ext.fileExtension = @"pdf";
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ML" ofType:@"pdf"];
    ext.fileData = [NSData dataWithContentsOfFile:filePath];
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[[GetMessageFromWXResp alloc] init] autorelease];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

@end
