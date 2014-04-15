#import <Kiwi/Kiwi.h>
#import <EEEInjector/EEEInjector.h>
#import "XXCLASS_PREFIXXXInjections.h"

SPEC_BEGIN(XXCLASS_PREFIXXXInjectionsSpec)

describe(@"XXCLASS_PREFIXXXInjections", ^{
    context(@"with only explicit injections", ^{
        __block EEEInjector *injector;

        context(@"with test injections", ^{
            beforeEach(^{
                injector = [XXCLASS_PREFIXXXInjections mapTestInjections];
                injector.allowImplicitMapping = NO;
            });

            it(@"injects the application", ^{
                [[[UIApplication injectObject] should] equal:[UIApplication sharedApplication]];
            });

            it(@"injects the window", ^{
                [[[UIWindow injectObject] should] equal:[[UIApplication sharedApplication] keyWindow]];
            });

            it(@"injects the file manager", ^{
                [[[NSFileManager injectObject] shouldNot] beNil];
            });

            it(@"injects the notification center", ^{
                [[[NSNotificationCenter injectObject] shouldNot] beNil];
            });

            it(@"injects the user defaults", ^{
                [[[NSUserDefaults injectObject] shouldNot] beNil];
            });

            it(@"injects the current date", ^{
                [[[NSDate injectObject] should] beNonNil];
            });

            it(@"injects the root navigation controller", ^{
                [[[UINavigationController injectObject] should] equal:[UIApplication sharedApplication].keyWindow.rootViewController];
            });
        });

        context(@"with app (production) injections", ^{
            beforeEach(^{
                injector = [XXCLASS_PREFIXXXInjections mapAppInjections];
                injector.allowImplicitMapping = NO;
            });

            it(@"injects the user defaults", ^{
                [[[NSUserDefaults injectObject] should] beKindOfClass:[NSUserDefaults class]];
            });
        });
    });
});

SPEC_END
