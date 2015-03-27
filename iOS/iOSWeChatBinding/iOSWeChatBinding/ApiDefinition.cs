using System;

using UIKit;
using Foundation;
using ObjCRuntime;
using CoreGraphics;

namespace iOSWeChatBinding
{
	// @interface BaseReq : NSObject
	[BaseType (typeof (NSObject))]
	interface BaseReq {

		// @property (assign, nonatomic) int type;
		[Export ("type", ArgumentSemantic.UnsafeUnretained)]
		int Type { get; set; }

		// @property (retain, nonatomic) NSString * openID;
		[Export ("openID", ArgumentSemantic.Retain)]
		string OpenID { get; set; }
	}

	// @interface BaseResp : NSObject
	[BaseType (typeof (NSObject))]
	interface BaseResp {

		// @property (assign, nonatomic) int errCode;
		[Export ("errCode", ArgumentSemantic.UnsafeUnretained)]
		int ErrCode { get; set; }

		// @property (retain, nonatomic) NSString * errStr;
		[Export ("errStr", ArgumentSemantic.Retain)]
		string ErrStr { get; set; }

		// @property (assign, nonatomic) int type;
		[Export ("type", ArgumentSemantic.UnsafeUnretained)]
		int Type { get; set; }
	}

	// @interface SendMessageToWXReq : BaseReq
	[BaseType (typeof (BaseReq))]
	interface SendMessageToWXReq {

		// @property (retain, nonatomic) NSString * text;
		[Export ("text", ArgumentSemantic.Retain)]
		string Text { get; set; }

		// @property (retain, nonatomic) WXMediaMessage * message;
		[Export ("message", ArgumentSemantic.Retain)]
		WXMediaMessage Message { get; set; }

		// @property (assign, nonatomic) BOOL bText;
		[Export ("bText", ArgumentSemantic.UnsafeUnretained)]
		bool BText { get; set; }

		// @property (assign, nonatomic) int scene;
		[Export ("scene", ArgumentSemantic.UnsafeUnretained)]
		int Scene { get; set; }
	}

	// @interface SendMessageToWXResp : BaseResp
	[BaseType (typeof (BaseResp))]
	interface SendMessageToWXResp {

	}

	// @interface GetMessageFromWXReq : BaseReq
	[BaseType (typeof (BaseReq))]
	interface GetMessageFromWXReq {

	}

	// @interface GetMessageFromWXResp : BaseResp
	[BaseType (typeof (BaseResp))]
	interface GetMessageFromWXResp {

		// @property (retain, nonatomic) NSString * text;
		[Export ("text", ArgumentSemantic.Retain)]
		string Text { get; set; }

		// @property (retain, nonatomic) WXMediaMessage * message;
		[Export ("message", ArgumentSemantic.Retain)]
		WXMediaMessage Message { get; set; }

		// @property (assign, nonatomic) BOOL bText;
		[Export ("bText", ArgumentSemantic.UnsafeUnretained)]
		bool BText { get; set; }
	}

	// @interface ShowMessageFromWXReq : BaseReq
	[BaseType (typeof (BaseReq))]
	interface ShowMessageFromWXReq {

		// @property (retain, nonatomic) WXMediaMessage * message;
		[Export ("message", ArgumentSemantic.Retain)]
		WXMediaMessage Message { get; set; }
	}

	// @interface ShowMessageFromWXResp : BaseResp
	[BaseType (typeof (BaseResp))]
	interface ShowMessageFromWXResp {

	}

	// @interface LaunchFromWXReq : BaseReq
	[BaseType (typeof (BaseReq))]
	interface LaunchFromWXReq {

	}

	// @interface WXMediaMessage : NSObject
	[BaseType (typeof (NSObject))]
	interface WXMediaMessage {

		// @property (retain, nonatomic) NSString * title;
		[Export ("title", ArgumentSemantic.Retain)]
		string Title { get; set; }

		// @property (retain, nonatomic) NSString * description;
		[Export ("description", ArgumentSemantic.Retain)]
		string Description { get; set; }

		// @property (retain, nonatomic) NSData * thumbData;
		[Export ("thumbData", ArgumentSemantic.Retain)]
		NSData ThumbData { get; set; }

		// @property (retain, nonatomic) NSString * mediaTagName;
		[Export ("mediaTagName", ArgumentSemantic.Retain)]
		string MediaTagName { get; set; }

		// @property (retain, nonatomic) id mediaObject;
		[Export ("mediaObject", ArgumentSemantic.Retain)]
		NSObject MediaObject { get; set; }

		// +(WXMediaMessage *)message;
		[Static, Export ("message")]
		WXMediaMessage Message ();

		// -(void)setThumbImage:(UIImage *)image;
		[Export ("setThumbImage:")]
		void SetThumbImage (UIImage image);
	}

	// @interface WXImageObject : NSObject
	[BaseType (typeof (NSObject))]
	interface WXImageObject {

		// @property (retain, nonatomic) NSData * imageData;
		[Export ("imageData", ArgumentSemantic.Retain)]
		NSData ImageData { get; set; }

		// @property (retain, nonatomic) NSString * imageUrl;
		[Export ("imageUrl", ArgumentSemantic.Retain)]
		string ImageUrl { get; set; }

		// +(WXImageObject *)object;
		[Static, Export ("object")]
		WXImageObject Object ();
	}

	// @interface WXMusicObject : NSObject
	[BaseType (typeof (NSObject))]
	interface WXMusicObject {

		// @property (retain, nonatomic) NSString * musicUrl;
		[Export ("musicUrl", ArgumentSemantic.Retain)]
		string MusicUrl { get; set; }

		// @property (retain, nonatomic) NSString * musicLowBandUrl;
		[Export ("musicLowBandUrl", ArgumentSemantic.Retain)]
		string MusicLowBandUrl { get; set; }

		// @property (retain, nonatomic) NSString * musicDataUrl;
		[Export ("musicDataUrl", ArgumentSemantic.Retain)]
		string MusicDataUrl { get; set; }

		// @property (retain, nonatomic) NSString * musicLowBandDataUrl;
		[Export ("musicLowBandDataUrl", ArgumentSemantic.Retain)]
		string MusicLowBandDataUrl { get; set; }

		// +(WXMusicObject *)object;
		[Static, Export ("object")]
		WXMusicObject Object ();
	}

	// @interface WXVideoObject : NSObject
	[BaseType (typeof (NSObject))]
	interface WXVideoObject {

		// @property (retain, nonatomic) NSString * videoUrl;
		[Export ("videoUrl", ArgumentSemantic.Retain)]
		string VideoUrl { get; set; }

		// @property (retain, nonatomic) NSString * videoLowBandUrl;
		[Export ("videoLowBandUrl", ArgumentSemantic.Retain)]
		string VideoLowBandUrl { get; set; }

		// +(WXVideoObject *)object;
		[Static, Export ("object")]
		WXVideoObject Object ();
	}

	// @interface WXWebpageObject : NSObject
	[BaseType (typeof (NSObject))]
	interface WXWebpageObject {

		// @property (retain, nonatomic) NSString * webpageUrl;
		[Export ("webpageUrl", ArgumentSemantic.Retain)]
		string WebpageUrl { get; set; }

		// +(WXWebpageObject *)object;
		[Static, Export ("object")]
		WXWebpageObject Object ();
	}

	// @interface WXAppExtendObject : NSObject
	[BaseType (typeof (NSObject))]
	interface WXAppExtendObject {

		// @property (retain, nonatomic) NSString * url;
		[Export ("url", ArgumentSemantic.Retain)]
		string Url { get; set; }

		// @property (retain, nonatomic) NSString * extInfo;
		[Export ("extInfo", ArgumentSemantic.Retain)]
		string ExtInfo { get; set; }

		// @property (retain, nonatomic) NSData * fileData;
		[Export ("fileData", ArgumentSemantic.Retain)]
		NSData FileData { get; set; }

		// +(WXAppExtendObject *)object;
		[Static, Export ("object")]
		WXAppExtendObject Object ();
	}

	// @interface WXEmoticonObject : NSObject
	[BaseType (typeof (NSObject))]
	interface WXEmoticonObject {

		// @property (retain, nonatomic) NSData * emoticonData;
		[Export ("emoticonData", ArgumentSemantic.Retain)]
		NSData EmoticonData { get; set; }

		// +(WXEmoticonObject *)object;
		[Static, Export ("object")]
		WXEmoticonObject Object ();
	}

	// @interface WXFileObject : NSObject
	[BaseType (typeof (NSObject))]
	interface WXFileObject {

		// @property (retain, nonatomic) NSString * fileExtension;
		[Export ("fileExtension", ArgumentSemantic.Retain)]
		string FileExtension { get; set; }

		// @property (retain, nonatomic) NSData * fileData;
		[Export ("fileData", ArgumentSemantic.Retain)]
		NSData FileData { get; set; }

		// +(WXFileObject *)object;
		[Static, Export ("object")]
		WXFileObject Object ();
	}

	// @protocol WXApiDelegate <NSObject>
	[Protocol, Model]
	[BaseType (typeof (NSObject))]
	interface WXApiDelegate {

		// @optional -(void)onReq:(BaseReq *)req;
		[Export ("onReq:")]
		void OnReq (BaseReq req);

		// @optional -(void)onResp:(BaseResp *)resp;
		[Export ("onResp:")]
		void OnResp (BaseResp resp);
	}

	// @interface WXApi : NSObject
	[BaseType (typeof (NSObject))]
	interface WXApi {

		// +(BOOL)registerApp:(NSString *)appid;
		[Static, Export ("registerApp:")]
		bool RegisterApp (string appid);

		// +(BOOL)registerApp:(NSString *)appid withDescription:(NSString *)appdesc;
		[Static, Export ("registerApp:withDescription:")]
		bool RegisterApp (string appid, string appdesc);

		// +(BOOL)handleOpenURL:(NSURL *)url delegate:(id<WXApiDelegate>)delegate;
		[Static, Export ("handleOpenURL:delegate:")]
		bool HandleOpenURL (NSUrl url, WXApiDelegate wxApiDelegate);

		// +(BOOL)isWXAppInstalled;
		[Static, Export ("isWXAppInstalled")]
		bool IsWXAppInstalled ();

		// +(BOOL)isWXAppSupportApi;
		[Static, Export ("isWXAppSupportApi")]
		bool IsWXAppSupportApi ();

		// +(NSString *)getApiVersion;
		[Static, Export ("getApiVersion")]
		string GetApiVersion ();

		// +(NSString *)getWXAppInstallUrl;
		[Static, Export ("getWXAppInstallUrl")]
		string GetWXAppInstallUrl ();

		// +(BOOL)openWXApp;
		[Static, Export ("openWXApp")]
		bool OpenWXApp ();

		// +(BOOL)sendReq:(BaseReq *)req;
		[Static, Export ("sendReq:")]
		bool SendReq (BaseReq req);

		// +(BOOL)sendResp:(BaseResp *)resp;
		[Static, Export ("sendResp:")]
		bool SendResp (BaseResp resp);
	}
}