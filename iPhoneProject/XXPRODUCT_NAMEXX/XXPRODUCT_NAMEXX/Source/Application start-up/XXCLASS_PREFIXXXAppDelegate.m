#import "XXCLASS_PREFIXXXAppDelegate.h"
#import "XXCLASS_PREFIXXXInjections.h"
#import "XXCLASS_PREFIXXXTheme.h"
#import "XXCLASS_PREFIXXXMainViewController.h"

@implementation XXCLASS_PREFIXXXAppDelegate

- (UIWindow *)window
{
    if (!_window)
    {
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _window.backgroundColor = [UIColor whiteColor];
        _window.tintColor = [[XXCLASS_PREFIXXXTheme injectObject] colorForStyle:XXCLASS_PREFIXXXColorApplicationTint];
    }

    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self prepareInjections];
    [self assignRootViewController:nil];
    return [self makeWindowKeyAndVisible];
}

- (EEEInjector *)prepareInjections
{
    return [XXCLASS_PREFIXXXInjections mapAppInjections];
}

- (void)assignRootViewController:(UIViewController *)rootViewController
{
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    navigationController.viewControllers = @[rootViewController ?: [[XXCLASS_PREFIXXXMainViewController alloc] init]];
    self.window.rootViewController = navigationController;
}

- (BOOL)makeWindowKeyAndVisible
{
    [self.window makeKeyAndVisible];
    return YES;
}

@end
