#import <Kiwi/Kiwi.h>
#import "XXCLASS_PREFIXXXAsyncOperation.h"
#import "XXCLASS_PREFIXXXHTTPSessionManager.h"
#import "XXCLASS_PREFIXXXInjections.h"
#import "XXCLASS_PREFIXXXModelRepository.h"

SPEC_BEGIN(XXCLASS_PREFIXXXAsyncOperationSpec)

        describe(@"XXCLASS_PREFIXXXAsyncOperation", ^{
            __block EEEInjector *injector;
            __block XXCLASS_PREFIXXXAsyncOperation *sut;

            beforeEach(^{
                injector = [XXCLASS_PREFIXXXInjections mapTestInjections];
            });

            describe(@"mocked injections", ^{
                it(@"injects the user defaults", ^{
                    id ud = [NSUserDefaults mock];
                    injector.mapClass([NSUserDefaults class]).toObject(ud);

                    sut = [[XXCLASS_PREFIXXXAsyncOperation alloc] init];
                    [[sut.userDefaults should] equal:ud];
                });

                it(@"injects the model repository", ^{
                    id mr = [XXCLASS_PREFIXXXModelRepository mock];
                    injector.mapClass([XXCLASS_PREFIXXXModelRepository class]).toObject(mr);

                    sut = [[XXCLASS_PREFIXXXAsyncOperation alloc] init];
                    [[sut.modelRepository should] equal:mr];
                });
                
                it(@"injects the current date", ^{
                    id date = [NSDate nullMock];
                    injector.mapClass([NSDate class]).toObject(date);

                    sut = [[XXCLASS_PREFIXXXAsyncOperation alloc] init];
                    [[sut.now should] equal:date];
                });
            });

            context(@"after alloc/init", ^{
                beforeEach(^{
                    sut = [[XXCLASS_PREFIXXXAsyncOperation alloc] initWithFeedback:nil];
                });

                it(@"injected a singleton session manager", ^{
                    XXCLASS_PREFIXXXAsyncOperation *sut2 = [[XXCLASS_PREFIXXXAsyncOperation alloc] initWithFeedback:nil];
                    [[sut.sessionManager should] equal:sut2.sessionManager];
                });

                it(@"injected the root navigation controller", ^{
                    [[sut.rootNavigationController should] beKindOfClass:[UINavigationController class]];
                });

                it(@"injected the shared application", ^{
                    [[sut.sharedApplication should] equal:[UIApplication sharedApplication]];
                });
            });
        });

        SPEC_END
