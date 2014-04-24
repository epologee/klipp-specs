#import <Kiwi/Kiwi.h>
#import "XXCLASS_PREFIXXXOperation.h"
#import "XXCLASS_PREFIXXXInjections.h"
#import "XXCLASS_PREFIXXXHTTPSessionManager.h"
#import "XXCLASS_PREFIXXXModelRepository.h"

SPEC_BEGIN(XXCLASS_PREFIXXXOperationSpec)

        describe(@"XXCLASS_PREFIXXXOperation", ^{
            __block EEEInjector *injector;
            __block XXCLASS_PREFIXXXOperation *sut;

            beforeEach(^{
                injector = [XXCLASS_PREFIXXXInjections mapTestInjections];
            });

            describe(@"mocked injections", ^{
              it(@"injects the user defaults", ^{
                  id ud = [NSUserDefaults mock];
                  [[injector mapClass:[NSUserDefaults class] overwriteExisting:YES] toObject:ud];

                  sut = [[XXCLASS_PREFIXXXOperation alloc] init];
                  [[sut.userDefaults should] equal:ud];
              });

              it(@"injects the model repository", ^{
                  id mr = [XXCLASS_PREFIXXXModelRepository mock];
                  [[injector mapClass:[XXCLASS_PREFIXXXModelRepository class] overwriteExisting:YES] toObject:mr];

                  sut = [[XXCLASS_PREFIXXXOperation alloc] init];
                  [[sut.modelRepository should] equal:mr];
              });
              
              it(@"injects the current date", ^{
                  id date = [NSDate nullMock];
                  [[injector mapClass:[NSDate class] overwriteExisting:YES] toObject:date];

                  sut = [[XXCLASS_PREFIXXXOperation alloc] init];
                  [[sut.now should] equal:date];
              });
            });

            context(@"after alloc/init", ^{
              beforeEach(^{
                  sut = [[XXCLASS_PREFIXXXOperation alloc] init];
              });

              it(@"injects a singleton session manager", ^{
                  XXCLASS_PREFIXXXOperation *sut2 = [[XXCLASS_PREFIXXXOperation alloc] init];
                  [[sut.sessionManager should] equal:sut2.sessionManager];
              });

              it(@"injects the root navigation controller", ^{
                  [[sut.rootNavigationController should] equal:[UIApplication sharedApplication].keyWindow.rootViewController];
              });

              it(@"injects the shared application", ^{
                  [[sut.sharedApplication should] equal:[UIApplication sharedApplication]];
              });
            });
        });

        SPEC_END
