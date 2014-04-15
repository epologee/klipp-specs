#import <Kiwi/Kiwi.h>
#import "XXCLASS_PREFIXXXOperation.h"
#import "XXCLASS_PREFIXXXInjections.h"
#import "XXCLASS_PREFIXXXHTTPSessionManager.h"
#import "XXCLASS_PREFIXXXModelRepository.h"

SPEC_BEGIN(XXCLASS_PREFIXXXOperationSpec)

        describe(@"XXCLASS_PREFIXXXOperation", ^{
            __block EEEInjector *injector;

            beforeEach(^{
                injector = [XXCLASS_PREFIXXXInjections mapTestInjections];
            });

            it(@"injects a singleton session manager", ^{
                XXCLASS_PREFIXXXOperation *sut1 = [[XXCLASS_PREFIXXXOperation alloc] init];
                XXCLASS_PREFIXXXOperation *sut2 = [[XXCLASS_PREFIXXXOperation alloc] init];
                [[sut1.sessionManager should] equal:sut2.sessionManager];
            });

            it(@"injects the root navigation controller", ^{
                XXCLASS_PREFIXXXOperation *sut = [[XXCLASS_PREFIXXXOperation alloc] init];
                [[sut.rootNavigationController should] equal:[UIApplication sharedApplication].keyWindow.rootViewController];
            });

            it(@"injects the shared application", ^{
                XXCLASS_PREFIXXXOperation *sut = [[XXCLASS_PREFIXXXOperation alloc] init];
                [[sut.sharedApplication should] equal:[UIApplication sharedApplication]];
            });

            it(@"injects the user defaults", ^{
                id ud = [NSUserDefaults mock];
                [[injector mapClass:[NSUserDefaults class] overwriteExisting:YES] toObject:ud];

                XXCLASS_PREFIXXXOperation *sut = [[XXCLASS_PREFIXXXOperation alloc] init];
                [[sut.userDefaults should] equal:ud];
            });

            it(@"injects the model repository", ^{
                id mr = [XXCLASS_PREFIXXXModelRepository mock];
                [[injector mapClass:[XXCLASS_PREFIXXXModelRepository class] overwriteExisting:YES] toObject:mr];

                XXCLASS_PREFIXXXOperation *sut = [[XXCLASS_PREFIXXXOperation alloc] init];
                [[sut.modelRepository should] equal:mr];
            });
        });

        SPEC_END
