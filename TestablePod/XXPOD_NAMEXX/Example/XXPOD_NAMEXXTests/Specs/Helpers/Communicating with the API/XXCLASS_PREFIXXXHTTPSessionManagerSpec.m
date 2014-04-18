#import <Kiwi/Kiwi.h>
#import "XXCLASS_PREFIXXXHTTPSessionManager.h"
#import "NSError+XXCLASS_PREFIXXXErrors.h"
#import "AFURLConnectionOperation.h"

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

            it(@"calls the success block with the json response", ^{
                KWCaptureSpy *completionSpy = [sut captureArgument:@selector(dataTaskWithRequest:completionHandler:) atIndex:1];
    
                __block id actualResponse = nil;
                [sut POSTToController:@"controller"
                               action:@"action"
                           parameters:nil
                              success:^(id jsonResponse) {
                                  actualResponse = jsonResponse;
                              }
                              failure:nil];
    
                void (^completionBlock)(NSURLResponse *, id, NSError *) = completionSpy.argument;
    
                NSDictionary *expectedResponse = @{@"it": @"works"};
                completionBlock(nil, expectedResponse, nil);
    
                [[actualResponse should] equal:expectedResponse];
            });
    
            describe(@"errors", ^{
                it(@"handles http errors", ^{
                    KWCaptureSpy *completionSpy = [sut captureArgument:@selector(dataTaskWithRequest:completionHandler:) atIndex:1];
    
                    __block NSError *expectedError = nil;
                    [sut POSTToController:@"controller"
                                   action:@"action"
                               parameters:nil
                                  success:nil
                                  failure:^(NSError *e) {
                                      expectedError = e;
                                  }];
    
                    void (^completionBlock)(NSURLResponse *, id, NSError *) = completionSpy.argument;
    
                    NSError *mockError = [NSError mock];
                    [mockError stub:@selector(domain) andReturn:AFNetworkingErrorDomain];
    
                    NSHTTPURLResponse *mockResponse = [NSHTTPURLResponse mock];
                    [[mockResponse should] receive:@selector(statusCode) andReturn:theValue(404)];
    
                    completionBlock(mockResponse, nil, mockError);
    
                    [[theValue(expectedError.code) should] equal:theValue(XXCLASS_PREFIXXXErrorCodeHTTPStatus)];
                    [[expectedError.userInfo[XXCLASS_PREFIXXXErrorUserInfoStatusCodeKey] should] equal:theValue(404)];
                });
    
                it(@"handles url errors", ^{
                    KWCaptureSpy *completionSpy = [sut captureArgument:@selector(dataTaskWithRequest:completionHandler:) atIndex:1];
    
                    __block NSError *expectedError = nil;
                    [sut POSTToController:@"controller"
                                   action:@"action"
                               parameters:nil
                                  success:nil
                                  failure:^(NSError *e) {
                                      expectedError = e;
                                  }];
    
                    void (^completionBlock)(NSURLResponse *, id, NSError *) = completionSpy.argument;
    
                    NSError *mockError = [NSError mock];
                    [mockError stub:@selector(domain) andReturn:NSURLErrorDomain];
    
                    completionBlock(nil, nil, mockError);
    
                    [[theValue(expectedError.code) should] equal:theValue(XXCLASS_PREFIXXXErrorCodeNetworkIssue)];
                });
    
                it(@"handles empty json responses", ^{
                    KWCaptureSpy *completionSpy = [sut captureArgument:@selector(dataTaskWithRequest:completionHandler:) atIndex:1];
    
                    __block NSError *expectedError = nil;
                    [sut POSTToController:@"controller"
                                   action:@"action"
                               parameters:nil
                                  success:nil
                                  failure:^(NSError *e) {
                                      expectedError = e;
                                  }];
    
                    void (^completionBlock)(NSURLResponse *, id, NSError *) = completionSpy.argument;
    
                    completionBlock(nil, nil, nil);
    
                    [[theValue(expectedError.code) should] equal:theValue(XXCLASS_PREFIXXXErrorCodeResponseEmpty)];
                });
    
                it(@"handles non-dictionary json responses", ^{
                    KWCaptureSpy *completionSpy = [sut captureArgument:@selector(dataTaskWithRequest:completionHandler:) atIndex:1];
    
                    __block NSError *expectedError = nil;
                    [sut POSTToController:@"controller"
                                   action:@"action"
                               parameters:nil
                                  success:nil
                                  failure:^(NSError *e) {
                                      expectedError = e;
                                  }];
    
                    void (^completionBlock)(NSURLResponse *, id, NSError *) = completionSpy.argument;
    
                    completionBlock(nil, @[], nil);
    
                    [[theValue(expectedError.code) should] equal:theValue(XXCLASS_PREFIXXXErrorCodeResponseMalformed)];
                });
            });
        });

    SPEC_END
        