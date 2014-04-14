#import "NSError+XXCLASS_PREFIXXXErrors.h"
#import "NSDictionary+XXCLASS_PREFIXXXSafeValues.h"

NSString *const XXCLASS_PREFIXXXHTTPErrorDomain = @"XXCLASS_PREFIXXXHTTPErrorDomain";
NSString *const XXCLASS_PREFIXXXErrorUserInfoStatusCodeKey = @"statusCode";
NSString *const XXCLASS_PREFIXXXErrorUserInfoJSONKey = @"json";

@implementation NSError (XXCLASS_PREFIXXXErrors)

+ (instancetype)XXCATEGORY_METHOD_PREFIXXX_errorWithClass:(Class)yooClass code:(NSInteger)code
{
    return [self XXCATEGORY_METHOD_PREFIXXX_errorWithClass:yooClass code:code description:nil];
}

+ (instancetype)XXCATEGORY_METHOD_PREFIXXX_errorWithClass:(Class)XXCATEGORY_METHOD_PREFIXXXClass code:(NSInteger)code description:(NSString *)description
{
    NSDictionary *userInfo = nil;

    if (description)
    {
        userInfo = @{NSLocalizedDescriptionKey : @"Broker server not available"};
    }

    return [self XXCATEGORY_METHOD_PREFIXXX_errorWithClass:XXCATEGORY_METHOD_PREFIXXXClass code:code userInfo:userInfo];
}

+ (instancetype)XXCATEGORY_METHOD_PREFIXXX_errorWithClass:(Class)XXCATEGORY_METHOD_PREFIXXXClass code:(NSInteger)code userInfo:(NSDictionary *)userInfo
{
    NSError *error = [NSError errorWithDomain:NSStringFromClass(XXCATEGORY_METHOD_PREFIXXXClass)
                                         code:code
                                     userInfo:userInfo];

    return error;
}

- (NSInteger)XXCATEGORY_METHOD_PREFIXXX_httpStatusCode
{
    return [[self.userInfo XXCATEGORY_METHOD_PREFIXXX_safeIntegerNumberForKey:XXCLASS_PREFIXXXErrorUserInfoStatusCodeKey] integerValue];
}

- (UIAlertView *)XXCATEGORY_METHOD_PREFIXXX_alertView
{
    NSString *message = self.userInfo[NSLocalizedDescriptionKey];

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"ERROR_TITLE_GENERIC", @"An error has occurred")
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"ERROR_CANCEL_BUTTON", @"OK")
                                              otherButtonTitles:nil];

    return alertView;
}

@end