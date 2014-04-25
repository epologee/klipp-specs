#import "KWSpec+KIFAdditions.h"
#import <EEEInjector/EEEInjector.h>
#import "XXCLASS_PREFIXXXAppDelegate.h"

SPEC_BEGIN(MainInterfaceFeature)
    EEEInjector *(^resetApplication)(UIViewController *rootViewController) = ^EEEInjector *(UIViewController *rootViewController) {
        EEEInjector *injector = [(XXCLASS_PREFIXXXAppDelegate *) [UIApplication sharedApplication].delegate prepareInjections];
        XXCLASS_PREFIXXXAppDelegate *appDelegate = [XXCLASS_PREFIXXXAppDelegate injectObject];
        [appDelegate assignRootViewController:rootViewController];
        [appDelegate makeWindowKeyAndVisible];
        return injector;
    };

    describe(@"Shows the app's main interface", ^{
        __block EEEInjector *injector;
        
        beforeEach(^{
            injector = resetApplication(nil);
        });
    
        it(@"shows the first view controller", ^{
            [tester waitForViewWithAccessibilityLabel:@"XXPRODUCT_NAMEXX"];
        });
    });

SPEC_END
