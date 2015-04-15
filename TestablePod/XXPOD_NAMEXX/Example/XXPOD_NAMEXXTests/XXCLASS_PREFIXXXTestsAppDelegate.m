#import <UIKit/UIKit.h>

@interface XXCLASS_PREFIXXXTestsAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

@implementation XXCLASS_PREFIXXXTestsAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UINavigationController *nc = [[UINavigationController alloc] init];
    nc.title = @"Running tests...";
    self.window.rootViewController = nc;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
