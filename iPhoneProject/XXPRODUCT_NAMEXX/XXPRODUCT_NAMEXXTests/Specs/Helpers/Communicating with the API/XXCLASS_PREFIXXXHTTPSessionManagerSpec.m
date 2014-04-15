#import <Kiwi/Kiwi.h>
#import "XXCLASS_PREFIXXXHTTPSessionManager.h"

SPEC_BEGIN(XXCLASS_PREFIXXXHTTPSessionManagerSpec)

        describe(@"XXCLASS_PREFIXXXHTTPSessionManager", ^{
            __block XXCLASS_PREFIXXXHTTPSessionManager *sut;

            beforeEach(^{
                sut = [[XXCLASS_PREFIXXXHTTPSessionManager alloc] init];
            });

            it(@"post requests to controller", ^{
                sut.requestSerializer = [AFHTTPRequestSerializer mock];

                [[sut.requestSerializer should] receive:@selector(requestWithMethod:URLString:parameters:error:)
                                          withArguments:@"POST",
                                                        @"http://127.0.0.1:3000/controller/action",
                                                        any(),
                                                        any()
                ];

                [[sut should] receive:@selector(dataTaskWithRequest:completionHandler:) andReturn:nil];

                [sut POSTToController:@"controller"
                               action:@"action"
                           parameters:nil
                              success:nil
                              failure:nil];
            });
        });

        SPEC_END
