#import "XXCLASS_PREFIXXXTheme.h"
#import "XXCLASS_PREFIXXXFirstViewController.h"
#import "XXCLASS_PREFIXXXInjections.h"

#import <UIKit/UIKit.h>

@interface XXCLASS_PREFIXXXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

@implementation XXCLASS_PREFIXXXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [XXCLASS_PREFIXXXInjections mapAppInjections];

    self.window.tintColor = [[XXCLASS_PREFIXXXTheme injectObject] colorForStyle:XXCLASS_PREFIXXXColorApplicationTint];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    navigationController.viewControllers = @[[[XXCLASS_PREFIXXXFirstViewController alloc] init]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
