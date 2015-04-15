#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, XXCLASS_PREFIXXXErrorCode) {
    XXCLASS_PREFIXXXErrorCodeUnknown = 0,
    XXCLASS_PREFIXXXErrorCodeGeneric,
    XXCLASS_PREFIXXXErrorCodeHTTPStatus,
    XXCLASS_PREFIXXXErrorCodeNetworkIssue,
    XXCLASS_PREFIXXXErrorCodeResponseEmpty,
    XXCLASS_PREFIXXXErrorCodeResponseMalformed,
};

extern NSString *const XXCLASS_PREFIXXXErrorUserInfoStatusCodeKey;
extern NSString *const XXCLASS_PREFIXXXErrorUserInfoJSONKey;

@interface NSError (XXCLASS_PREFIXXXErrors)

+ (instancetype)XXCATEGORY_METHOD_PREFIXXX_errorWithClass:(Class)XXCATEGORY_METHOD_PREFIXXXClass code:(XXCLASS_PREFIXXXErrorCode)code;

+ (instancetype)XXCATEGORY_METHOD_PREFIXXX_errorWithClass:(Class)XXCATEGORY_METHOD_PREFIXXXClass code:(XXCLASS_PREFIXXXErrorCode)code description:(NSString *)description;

+ (instancetype)XXCATEGORY_METHOD_PREFIXXX_errorWithClass:(Class)XXCATEGORY_METHOD_PREFIXXXClass code:(XXCLASS_PREFIXXXErrorCode)code httpStatusCode:(NSInteger)httpStatusCode;

+ (instancetype)XXCATEGORY_METHOD_PREFIXXX_errorWithClass:(Class)XXCATEGORY_METHOD_PREFIXXXClass code:(XXCLASS_PREFIXXXErrorCode)code userInfo:(NSDictionary *)userInfo;

- (NSInteger)XXCATEGORY_METHOD_PREFIXXX_httpStatusCode;

- (UIAlertView *)XXCATEGORY_METHOD_PREFIXXX_alertView;

@end