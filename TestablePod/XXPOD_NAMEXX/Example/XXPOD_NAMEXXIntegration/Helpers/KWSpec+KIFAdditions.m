#import "KWSpec+KIFAdditions.h"

@implementation KWSpec (KIFAdditions)

+ (void)failWithException:(NSException *)exception stopTest:(BOOL)stop
{
    KWExampleSuiteBuilder *builder = [KWExampleSuiteBuilder sharedExampleSuiteBuilder];
    KWExample *example = [builder currentExample];
    NSString *filename = exception.userInfo[@"SenTestFilenameKey"];
    NSUInteger lineNumber = [exception.userInfo[@"SenTestLineNumberKey"] unsignedIntegerValue];
    KWCallSite *callSite = [KWCallSite callSiteWithFilename:filename lineNumber:lineNumber];
    KWFailure *failure = [KWFailure failureWithCallSite:callSite format:@"%@", exception.description];
    [example reportFailure:failure];
    if (stop) {[exception raise];}
}

+ (void)failWithExceptions:(NSArray *)exceptions stopTest:(BOOL)stop
{
    for (NSException *exception in exceptions)
    {
        [self failWithException:exception stopTest:exception == exceptions.lastObject ? stop : NO];
    }
}

- (void)failWithException:(NSException *)exception stopTest:(BOOL)stop
{
    [[self class] failWithException:exception stopTest:stop];
}

- (void)failWithExceptions:(NSArray *)exceptions stopTest:(BOOL)stop
{
    [[self class] failWithExceptions:exceptions stopTest:stop];
}

@end