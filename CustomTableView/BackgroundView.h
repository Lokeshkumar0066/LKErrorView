//
//  BackgroundView.h
//  CustomTableView
//
//  Created by Apple on 02/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BackgroundViewDelegate <NSObject>
- (void)errorMessageDelegate :(NSString *)btnTitle;
@end

@interface BackgroundView : UIView
@property (nonatomic,weak) id <BackgroundViewDelegate> delegate;
+ (BackgroundView *)initlization;
-(void)initWithDefaultNibAndDelegate:(id<BackgroundViewDelegate>)delegate message:(NSString *)message btnOK:(NSString *)btnOK errorEmojiImage:(NSString *)errorEmojiImage vc:(UIViewController *)viewController;
@property (nonatomic, strong) UIColor *buttonBgColor;
@property (nonatomic, strong) UIColor *buttonTextColor;
@property (nonatomic, strong) UIColor *errorMessageColor;
@property (nonatomic, strong) NSString *fontName;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) BOOL stopAnimation;
@property (nonatomic, assign) NSInteger animationCount;
@end
