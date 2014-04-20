#import <UIKit/UIKit.h>

@interface XXCLASS_PREFIXXXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)prepareInjections;
- (void)assignRootViewController;
- (BOOL)makeWindowKeyAndVisible;

@end