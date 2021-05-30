#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface _ASDisplayView : UIView
@end

%hook _ASDisplayView
-(void)layoutSubviews {
	%orig;
	if([[NSString stringWithFormat:@"%@", [self nextResponder]] rangeOfString:@"Reddit.CommentTreeHeaderTwoLineNode-View"].location != NSNotFound) {
		CGPoint _center = self.center;
		_center.x = _center.x - ((CGFloat)35);
		self.center = _center;

	}
}
%end

%hook ChatAvatarImageView
- (void)layoutSubviews {
    %orig;
	if([[NSString stringWithFormat:@"%@", [self nextResponder]] rangeOfString:@"Reddit.PresenceAvatarImageView"].location == NSNotFound) {
		[self removeFromSuperview];
	}
}
%end

%ctor {
    %init(ChatAvatarImageView = objc_getClass("Reddit.ChatAvatarImageView"));
}