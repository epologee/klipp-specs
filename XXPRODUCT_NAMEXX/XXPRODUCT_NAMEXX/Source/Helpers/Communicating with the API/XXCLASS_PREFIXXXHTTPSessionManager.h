#import <Foundation/Foundation.h>
#import "EEEAsyncOperation.h"
#import "AFHTTPSessionManager.h"

typedef void (^XXCLASS_PREFIXXXHTTPSuccessBlock)(id jsonResponse);

typedef EEERequestFailureBlock XXCLASS_PREFIXXXHTTPFailureBlock;

@interface XXCLASS_PREFIXXXHTTPSessionManager : AFHTTPSessionManager

- (instancetype)initWithBaseURL:(NSURL *)url UNAVAILABLE_ATTRIBUTE;

- (NSURLSessionDataTask *)POSTToController:(NSString *)controller
                                    action:(NSString *)action
                                parameters:(NSDictionary *)requestParameters
                                   success:(XXCLASS_PREFIXXXHTTPSuccessBlock)successBlock
                                   failure:(XXCLASS_PREFIXXXHTTPFailureBlock)failureBlock;

@end