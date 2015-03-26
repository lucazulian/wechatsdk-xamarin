//
//  MMApiObject.h
//  ApiClient
//
//  Created by Tencent on 12-2-28.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

/////////////////////////////////////////////////////////////

enum  WXErrCode {
    
    WXSuccess           = 0,
    WXErrCodeCommon     = -1,
    WXErrCodeUserCancel = -2,
    WXErrCodeSentFail   = -3,
    WXErrCodeAuthDeny   = -4,
    WXErrCodeUnsupport  = -5,
};

enum WXScene {
  
    WXSceneSession  = 0, 
    WXSceneTimeline = 1,
    WXSceneFavorite = 2,
};

/*! @brief Base class of all request classes of WeChat SDK
 *
 */
@interface BaseReq : NSObject

/** Request type */
@property (nonatomic, assign) int type;

/**
 * The unique identifier, comprised of a user’s WeChat ID and App ID, must be filled by developers while sending a request.
 * The purpose is to check whether the user has logged in with another account.
 */
@property (nonatomic, retain) NSString* openID;

@end

/*! @brief Base class of all response classes of WeChat SDK
 *
 */
@interface BaseResp : NSObject
/** Error code */
@property (nonatomic, assign) int errCode;
/** Error notification string */
@property (nonatomic, retain) NSString *errStr;
/** Response type */
@property (nonatomic, assign) int type;

@end

@class WXMediaMessage;

/*! @brief Message structure that the third-party application uses to send message to WeChat
 *
 * The third-party app uses SendMessageToWXReq to send messages to WeChat.
 * The message type can be text (member: text) and multi-media (member: message).
 * WeChat will then return the result after processing.
 * @see SendMessageToWXResp
 */
@interface SendMessageToWXReq : BaseReq
/** Text contents in the message sent
 * @note The size of texts should be within 0-10k.
 */
@property (nonatomic, retain) NSString* text;
/** Multi-media contents in the message sent
 * @see WXMediaMessage
 */
@property (nonatomic, retain) WXMediaMessage* message;
/** The message type can be Text or Multi-media but not both. */
@property (nonatomic, assign) BOOL bText;

/**  Target scene, you can send to contact or moments. Contact if default choice.
 * @see WXScene
 */
@property (nonatomic, assign) int scene;

@end

/*! @brief Result of SendMessageToWXReq that WeChat returns to the third-party app
 *
 * Wechat uses SendMessageToWXResp to return results of SendMessageToWXReq from the third-party app.
 */
@interface SendMessageToWXResp : BaseResp
@end

/*! @brief Message structure that the third-party application uses to request authorization from WeChat
 *
 * The third-party app requests for verification and authorization by calling sendReq member function of WXApi.
 * WeChat will return a result after processing.
 
 */
@interface GetMessageFromWXReq : BaseReq
@end

/*! @brief Message structure that the third-party application uses to response requests from WeChat
 *
 * WeChat sends a request to a third-party application;
 * and the third-party application calls sendResp to return the result in a GetMessageFromWXResp message.
 */
@interface GetMessageFromWXResp : BaseResp
/** Text contents provided to WeChat
 @note The size of texts should be within 0-10k.
 */
@property (nonatomic, retain) NSString* text;
/** Multi-media contents provided to WeChat
 * @see WXMediaMessage
 */
@property (nonatomic, retain) WXMediaMessage* message;
/** Types of message that providing contents to WeChat. It could be text or multi-media but not both. */
@property (nonatomic, assign) BOOL bText;
@end

/*! @brief WeChat asks the third-party to show contents
 *
 * WeChat sends an ShowMessageFromWXReq message to ask the third-party app to show certain contents.
 * And the third-party app calls sendResp to send an ShowMessageFromWXResp message to WeChat after processing.
 */
@interface ShowMessageFromWXReq : BaseReq
/** WeChat asks the third-party to show contents
 * @see WXMediaMessage
 */
@property (nonatomic, retain) WXMediaMessage* message;
@end

/*! @brief WeChat sends an ShowMessageFromWXReq message to ask the third-party app to
 * show certain contents.
 * And the third-party app calls sendResp to send an ShowMessageFromWXResp message to
 * WeChat after processing.
 */@interface ShowMessageFromWXResp : BaseResp
@end

/*! @brief The message structure carried by WeChat client when a third-party application is opened
 *
 *  This is the WeChat’s data structure sent to a third party. No return value expected from the third party.
 */
@interface LaunchFromWXReq : BaseReq
@end


#pragma mark - WXMediaMessage

/** Multi-media contents in the message sent
 * @see WXMediaMessage
 */
@interface WXMediaMessage : NSObject

+(WXMediaMessage *) message;

/** Title
 * @note contents can not exceed 512 bytes
 */
@property (nonatomic, retain) NSString *title;
/** Description
 * @note contents can not exceed 1k
 */
@property (nonatomic, retain) NSString *description;
/** Data of the thumb
 * @note contents can not exceed 32K
 */
@property (nonatomic, retain) NSData   *thumbData;
/** todo
 * @note contents can not exceed 64 bytes
 */
@property (nonatomic, retain) NSString *mediaTagName;
/** Multi-media data object, including WXWebpageObject, WXImageObject, WXMusicObject, etc. */
@property (nonatomic, retain) id        mediaObject;

/*! @brief Method used to set the thumb of image message
 *
 * @param image Thumb
 * @note contents can not exceed 32K
 */
- (void) setThumbImage:(UIImage *)image;

@end


#pragma mark -
/*! @brief Image object included in multi-media messages
 *
 * The image object included in the message transferred between WeChat and the third-party app
 * @note imageData and imageUrl can not be left blank at the same time.
 * @see WXMediaMessage
 */
@interface WXImageObject : NSObject
/*! @brief Return a WXImageObject object
 *
 * @note The WXImageObject object returned is auto-released.
 */
+(WXImageObject *) object;

/** Actual contents of the image
 * @note file size can not exceed 10M.
 */
@property (nonatomic, retain) NSData    *imageData;
/** Image URL
 * @note contents can not exceed 10K
 */
@property (nonatomic, retain) NSString  *imageUrl;

@end

/*! @brief Music object included in multi-media messages
 *
 * Music object included in the message transferred between WeChat and the third-party app
 * @note musicUrl and musicLowBandUrl member can not be left blank at the same time.
 * @see WXMediaMessage
 */
@interface WXMusicObject : NSObject
/*! @brief Return a WXMusicObject object
 *
 * @note The WXMusicObject object returned is auto-released.
 */
+(WXMusicObject *) object;

/** URL of music webpage
 * @note contents can not exceed 10K
 */
@property (nonatomic, retain) NSString *musicUrl;
/** URL of music lowband webpage
 * @note contents can not exceed 10K
 */
@property (nonatomic, retain) NSString *musicLowBandUrl;
/** URL of music data
 * @note contents can not exceed 10K
 */
@property (nonatomic, retain) NSString *musicDataUrl;

/** URL of lowband data of the music
 * @note  contents can not exceed 10K
 */
@property (nonatomic, retain) NSString *musicLowBandDataUrl;

@end

/*! @brief Video object included in multi-media messages
 *
 * Video object included in the message transferred between WeChat and the third-party app
 * @note videoUrl and videoLowBandUrl can not be left blank at the same time.
 * @see WXMediaMessage
 */
@interface WXVideoObject : NSObject
/*! @brief Returns a WXVideoObject object
 *
 * @note The WXVideoObject object returned is automatically released.
 */
+(WXVideoObject *) object;

/** URL of video data
 * @note contents can not exceed 10K
 */
@property (nonatomic, retain) NSString *videoUrl;
/** URL of video lowband data
 * @note contents can not exceed 10K
 */
@property (nonatomic, retain) NSString *videoLowBandUrl;

@end

/*! @brief Webpage object included in multi-media messages
 *
 * Webpage object included in the multi-media message transferred between WeChat and the third-party app
 * @see WXMediaMessage
 */
@interface WXWebpageObject : NSObject
/*! @brief Return a WXWebpageObject object
 *
 * @note The WXWebpageObject object returned is auto-released.
 */
+(WXWebpageObject *) object;

/** URL of the webpage
 * @note It can not be left blank and the size can not exceed 10K.
 */
@property (nonatomic, retain) NSString *webpageUrl;

@end

/*! @brief App extend object included in multi-media messages
 *
 * The third-party app sends a multi-media message that includes WXAppExtendObject to WeChat.
 * WeChat calls this app to process the multi-media contents.
 * @note url, extInfo and fileData can not be left blank at the same time.
 * @see WXMediaMessage
 */
@interface WXAppExtendObject : NSObject
/*! @brief Return a WXAppExtendObject object
 *
 * @note The WXAppExtendObject object returned is auto-released.
 */
+(WXAppExtendObject *) object;

/** If the third-party app does not exist, WeChat will open the download URL of the app.
 * @note contents can not exceed 10K
 */
@property (nonatomic, retain) NSString *url;
/** Custom data of the third-party app. WeChat will return it to the app for processing.
 * @note contents can not exceed 2K
 */
@property (nonatomic, retain) NSString *extInfo;
/** App file data. When this data is sent to WeChat contacts, the contact needs to click to download.
 * WeChat then returns it to the app for processing.
 * @note file size can not exceed 10M.
 */
@property (nonatomic, retain) NSData   *fileData;

@end

/*! @brief Emoticon object included in multi-media messages transferred between WeChat and the third-party app
 *
 * @see WXMediaMessage
 */
@interface WXEmoticonObject : NSObject

/*! @brief Return a WXEmoticonObject object
 *
 * @note The WXEmoticonObject object returned is auto-released.
 */
+(WXEmoticonObject *) object;

/** The content of emoticon
 * @note contents can not exceed 10M.
 */
@property (nonatomic, retain) NSData    *emoticonData;

@end

/*! @brief todo
 *
 * @see WXMediaMessage
 */
@interface WXFileObject : NSObject

/*! @brief Returns a WXFileObject object
 *
 * @note The WXFileObject object returned is automatically released.
 */
+(WXFileObject *) object;

/** File Extensions
 * @note Must be less than 64 bytes
 */
@property (nonatomic, retain) NSString  *fileExtension;

/** File content
 * @note Must be less than 64 bytes
 */
@property (nonatomic, retain) NSData    *fileData;

@end
