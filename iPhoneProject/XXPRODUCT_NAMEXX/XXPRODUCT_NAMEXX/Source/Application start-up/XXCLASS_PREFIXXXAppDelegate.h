#import <UIKit/UIKit.h>

@class EEEInjector;

@interface XXCLASS_PREFIXXXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (EEEInjector *)prepareInjections;
- (void)assignRootViewController:(UIViewController *)rootViewController;
- (BOOL)makeWindowKeyAndVisible;

@end