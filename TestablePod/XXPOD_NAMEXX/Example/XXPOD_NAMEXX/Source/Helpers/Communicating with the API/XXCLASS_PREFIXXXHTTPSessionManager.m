#import "XXCLASS_PREFIXXXHTTPSessionManager.h"
#import "AFURLConnectionOperation.h"
#import "NSError+XXCLASS_PREFIXXXErrors.h"

@implementation XXCLASS_PREFIXXXHTTPSessionManager

- (instancetype)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:@"http://127.0.0.1:3000"]];

    if (self)
    {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/plain", nil]];
    }

    return self;
}

- (NSURLSessionDataTask *)POSTToController:(NSString *)controller
                                    action:(NSString *)action
                                parameters:(NSDictionary *)requestParameters
                                   success:(XXCLASS_PREFIXXXHTTPSuccessBlock)successBlock
                                   failure:(XXCLASS_PREFIXXXHTTPFailureBlock)failureBlock
{
    return [self dataTaskWithHTTPMethod:@"POST"
                             controller:controller
                                 action:action
                             parameters:requestParameters
                                success:successBlock
                                failure:failureBlock];
}

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                      controller:(NSString *)controller
                                          action:(NSString *)action
                                      parameters:(NSDictionary *)parameters
                                         success:(void (^)(id result))successBlock
                                         failure:(void (^)(NSError *error))failureBlock
{

    NSString *urlString;
    NSMutableArray *segments = [NSMutableArray arrayWithObjects:controller, nil];
    if (action)
    {
        [segments addObject:action];
    }
    urlString = [[NSURL URLWithString:[segments componentsJoinedByString:@"/"] relativeToURL:self.baseURL] absoluteString];

    NSError *requestError = nil;
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method
                                                                   URLString:urlString
                                                                  parameters:parameters
                                                                       error:&requestError];

    NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse *__unused response, id jsonResponse, NSError *error) {
        if (error)
        {
            NSError *e = error;
            if (error.domain == AFNetworkingErrorDomain)
            {
                if ([response isKindOfClass:[NSHTTPURLResponse class]])
                {
                    NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
                    e = [NSError XXCATEGORY_METHOD_PREFIXXX_errorWithClass:[self class]
                                                                      code:XXCLASS_PREFIXXXErrorCodeHTTPStatus
                                                                  userInfo:@{XXCLASS_PREFIXXXErrorUserInfoStatusCodeKey : @(statusCode)}];
                }
            }
            else if (error.domain == NSURLErrorDomain)
            {
                e = [NSError XXCATEGORY_METHOD_PREFIXXX_errorWithClass:[self class] code:XXCLASS_PREFIXXXErrorCodeNetworkIssue];
            }
            failureBlock(e);
        }
        else if (!jsonResponse)
        {
            NSError *e = [NSError XXCATEGORY_METHOD_PREFIXXX_errorWithClass:[self class] code:XXCLASS_PREFIXXXErrorCodeResponseEmpty];
            failureBlock(e);
        }
        else if (![jsonResponse isKindOfClass:[NSDictionary class]])
        {
            NSError *e = [NSError XXCATEGORY_METHOD_PREFIXXX_errorWithClass:[self class]
                                                                       code:XXCLASS_PREFIXXXErrorCodeResponseMalformed
                                                                   userInfo:@{XXCLASS_PREFIXXXErrorUserInfoJSONKey : jsonResponse}];
            failureBlock(e);
        }
        else
        {
            successBlock(jsonResponse);
        }
    }];

    [task resume];

    return task;
}
@end