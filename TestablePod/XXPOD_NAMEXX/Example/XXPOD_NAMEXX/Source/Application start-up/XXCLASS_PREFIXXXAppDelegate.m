#import "XXCLASS_PREFIXXXAppDelegate.h"
#import "XXCLASS_PREFIXXXInjections.h"
#import "XXCLASS_PREFIXXXTheme.h"
#import "XXCLASS_PREFIXXXFirstViewController.h"

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
    [self assignRootViewController];
    return [self makeWindowKeyAndVisible];
}

- (void)prepareInjections
{
    [XXCLASS_PREFIXXXInjections mapAppInjections];
}

- (void)assignRootViewController
{
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    navigationController.viewControllers = @[[[XXCLASS_PREFIXXXFirstViewController alloc] init]];
    self.window.rootViewController = navigationController;
}

- (BOOL)makeWindowKeyAndVisible
{
    [self.window makeKeyAndVisible];
    return YES;
}

@end
