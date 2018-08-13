# LKErrorView

Most applications show lists of content (data sets), which many turn out to be empty at one point, specially for new users with blank accounts. Empty screens create confusion by not being clear about what's going on, if there is an error/bug or if the user is supposed to do something within your app to be able to consume the content.


![error](https://user-images.githubusercontent.com/26429027/44015985-be57eb48-9ef0-11e8-8e35-5d2980a6ce11.gif)


Empty Data Sets are helpful for:

Avoiding white-screens and communicating to your users why the screen is empty.                                        
Calling to action (particularly as an onboarding process).                                        
Avoiding other interruptive mechanisms like showing error alerts.                                        
Being consistent and improving the user experience.                                        
Delivering a brand presence.                                        

#### Swift

You can use the same framework in Swift as well by creating the Bridging Header.

# Features

Can be used anywhere in the application for e.g UITableView, UICollectionView, etc...                                         
Background color customisation                                                                 
Compatible with Storyboard.                                                                 


You can use the library without making extra effort. You can call the LKErrorView by importing or integration itself on your working project. You can customize the library and make your own features.

# Requirements
iOS 9.0+                                                                  
Xcode 9.1+                                                                  
Swift 4.0+


# Manual
You can directly add the integrate into your working project.


Now, you can show ToastView with status message:                                                             
 BackgroundView *errorView = [BackgroundView initlization];                                                             
[errorView initWithDefaultNibAndDelegate:self message:@"Please check your internet connection." btnOK:@"Retry" errorEmojiImage:@"error-icon.png" vc:self];


# Customization

### Objective C

errorView.buttonTextColor = [UIColor redColor];                                                              
errorView.buttonBgColor = [UIColor greenColor];                                                              
errorView.errorMessageColor = [UIColor orangeColor];                                                              
errorView.fontSize = 16.0;                                                              
errorView.fontName = @"HelveticaNeue";                                                              


