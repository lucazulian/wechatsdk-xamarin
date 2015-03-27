using System;

namespace iOSWeChatBinding
{
	public enum WXErrCode {
		WXSuccess = 0,
		Common = -1,
		UserCancel = -2,
		SentFail = -3,
		AuthDeny = -4,
		Unsupport = -5
	}

	public enum WXScene : uint {
		Session = 0,
		Timeline = 1,
		Favorite = 2
	}
}