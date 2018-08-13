//
//  BackgroundView.m
//  CustomTableView
//
//  Created by Apple on 02/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "BackgroundView.h"
#import "UIFont+Fontutils.h"
#import "CALayer+LayerUtils.h"
#define DEFAULTERRORMESSAGE @"Oh-ho, nothing will be happeing"
#define DEFAULBUTTONTITLE @"Retry"
#define DEFAULEMOJI @"images2.jpeg"
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) /** BOOL: Detect if device is an iPad **/
#define BUTTONBGCOLOR [UIColor colorWithRed:30.0f/255.0f green:92.0f/255.0f blue:153.0f/255.0f alpha:1.0f]
#define BUTTONTEXTCOLOR [UIColor whiteColor]
#define ERRORMESSAGECOLOR [UIColor colorWithRed:30.0f/255.0f green:92.0f/255.0f blue:153.0f/255.0f alpha:1.0f]
#define ERRORMESSAGEFONT [UIFont fontWithName:@"Noteworthy Light" size:17.0]
#define FONTNAME @"Noteworthy Light"
#define FONTSIZE 17.0
#define ANIMATIONCOUNT 2
#define STOPANIMATION YES

@interface BackgroundView (){
    NSString *errorMessage;
    NSString *buttonTitle;
    NSString *emojiString;
}
@property (nonatomic, strong) UIViewController *currentViewController;
@property (weak, nonatomic) IBOutlet UILabel *lblErrorMessage;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imgEmoji;
@end

@implementation BackgroundView

#pragma mark Initlizated View....
+ (BackgroundView *)initlization{
    NSArray *allObjs;
    if(IS_IPAD)
    {
        allObjs = [[NSBundle mainBundle] loadNibNamed:@"BackgroundView" owner:nil options:nil];
    }
    else
    {
        allObjs = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BackgroundView class]) owner:nil options:nil];
    }
    BackgroundView *view = [allObjs firstObject];
    return view;
}

#pragma mark Load view
- (void)initalLoad{
    [self cornorRadius];
    [self changeTheFontSizeAndColor];
    [self messageDisplay];
    [self animatedImage];
    [self showOnView];
}

- (void)messageDisplay{
    self.lblErrorMessage.text = (errorMessage)?errorMessage:DEFAULTERRORMESSAGE;
    [self.okBtn setTitle:(buttonTitle)?buttonTitle:DEFAULBUTTONTITLE forState:UIControlStateNormal];
    self.imgEmoji.image = [UIImage imageNamed:(emojiString)?emojiString:DEFAULEMOJI];
}

- (void)cornorRadius{
    [self.okBtn.layer setCornorRadiusForButtons];
}

- (void) changeTheFontSizeAndColor{
    self.okBtn.backgroundColor = (self.buttonBgColor)?self.buttonBgColor:BUTTONBGCOLOR;
    [self.okBtn setTitleColor:(self.buttonTextColor)?self.buttonTextColor:BUTTONTEXTCOLOR forState:UIControlStateNormal];
    self.lblErrorMessage.textColor = (self.errorMessageColor)?self.errorMessageColor:ERRORMESSAGECOLOR;
    [self.lblErrorMessage setFont:[UIFont fontWithName:(self.fontName)?self.fontName:FONTNAME size:(self.fontSize)?self.fontSize:FONTSIZE]];
}

#pragma mark Emoji Bouncing Animation...

- (BOOL)animtionBegin{
    BOOL animation = (self.stopAnimation)?self.stopAnimation:STOPANIMATION;
    return animation;
}


- (void)animatedImage{
    if ([self animtionBegin]) {
        CGPoint origin = self.imgEmoji.center;
        CGPoint target = CGPointMake(self.imgEmoji.center.x, self.imgEmoji.center.y+60);
        CABasicAnimation *bounce = [CABasicAnimation animationWithKeyPath:@"position.y"];
        bounce.duration = 0.5;
        bounce.fromValue = [NSNumber numberWithInt:origin.y];
        bounce.toValue = [NSNumber numberWithInt:target.y];
        bounce.repeatCount = (self.animationCount)?self.animationCount:ANIMATIONCOUNT;
        bounce.autoreverses = YES;
        [self.imgEmoji.layer addAnimation:bounce forKey:@"position"];
    }
}


-(void)showOnView{
    self.frame = self.currentViewController.view.bounds;
    [self.currentViewController.view addSubview:self];
//    [self animationShow];
}

#pragma mark UIButton Moving Aniation From Bottom To Top..
- (void)animationShow{
    [UIView animateWithDuration:0.5
                          delay:0.5
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.okBtn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 45);
                     }
                     completion:^(BOOL finished){
                     }];
    [self addSubview:self.okBtn];
}

-(void)removeView{
    [self removeFromSuperview];
}

#pragma mark Init Default Method
-(void)initWithDefaultNibAndDelegate:(id<BackgroundViewDelegate>)delegate message:(NSString *)message btnOK:(NSString *)btnOK errorEmojiImage:(NSString *)errorEmojiImage vc:(UIViewController *)viewController{
    self.delegate = delegate;
    errorMessage = message;
    buttonTitle = btnOK;
    emojiString = errorEmojiImage;
    self.currentViewController = viewController;
    [self initalLoad];
}


#pragma Delegates Method Call
- (IBAction)BtnOk:(id)sender {
    if ([self.delegate respondsToSelector:@selector(errorMessageDelegate:)]) {
        [self removeView];
        [self.delegate errorMessageDelegate:@"Retry"];
    }
}


@end
