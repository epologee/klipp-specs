#import <Kiwi/Kiwi.h>
#import <EEEInjector/EEEInjector.h>
#import "XXCLASS_PREFIXXXAppDelegate.h"
#import "XXCLASS_PREFIXXXInjections.h"

SPEC_BEGIN(XXCLASS_PREFIXXXAppDelegateSpec)

        describe(@"XXCLASS_PREFIXXXAppDelegate", ^{
            context(@"after allocation", ^{
                __block XXCLASS_PREFIXXXAppDelegate *sut;

                beforeEach(^{
                    [EEEInjector setCurrentInjector:nil force:YES];
                    sut = [[XXCLASS_PREFIXXXAppDelegate alloc] init];
                });

                it(@"creates a window", ^{
                    [XXCLASS_PREFIXXXInjections mapTestInjections];
                    [[sut.window should] beKindOfClass:[UIWindow class]];
                });

                describe(@"application did finish launching", ^{
                    __block UIApplication *mockApp;

                    beforeEach(^{
                        mockApp = [UIApplication nullMock];
                        sut.window = [UIWindow nullMock];
                        [[XXCLASS_PREFIXXXInjections class] stub:@selector(mapAppInjections)];
                    });

                    it(@"prepares injections", ^{
                        [[[XXCLASS_PREFIXXXInjections class] should] receive:@selector(mapAppInjections)];
                        [sut application:mockApp didFinishLaunchingWithOptions:nil];
                    });

                    it(@"assigns a root view controller", ^{
                        [[sut.window should] receive:@selector(setRootViewController:)];
                        [sut application:mockApp didFinishLaunchingWithOptions:nil];
                    });

                    it(@"makes the window key and visible", ^{
                        [[sut.window should] receive:@selector(makeKeyAndVisible)];
                        [sut application:mockApp didFinishLaunchingWithOptions:nil];
                    });

                    it(@"returns yes", ^{
                        [[theValue([sut application:mockApp didFinishLaunchingWithOptions:nil]) should] beYes];
                    });
                });
            });
        });

        SPEC_END
