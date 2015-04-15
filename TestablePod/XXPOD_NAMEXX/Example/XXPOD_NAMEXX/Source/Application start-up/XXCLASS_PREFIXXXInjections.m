#import <EEEInjector/EEEInjector.h>
#import "XXCLASS_PREFIXXXInjections.h"
#import "XXCLASS_PREFIXXXHTTPSessionManager.h"
#import "EEEOperationCenter.h"
#import "XXCLASS_PREFIXXXTheme.h"

@implementation XXCLASS_PREFIXXXInjections

+ (EEEInjector *)mapTestInjections
{
    return [self mapInjectionsStagedForTest:YES];
}

+ (EEEInjector *)mapAppInjections
{
    return [self mapInjectionsStagedForTest:NO];
}

+ (EEEInjector *)mapInjectionsStagedForTest:(BOOL)test
{
    NSAssert([[NSThread currentThread] isMainThread], @"Run the injections from the main thread.");

    BOOL overwrite = NO;
    EEEInjector *injector = [self injectorForTest:test overwrite:&overwrite];

    [self mapInjectionsForTest:test withInjector:injector overwrite:overwrite];

    return injector;
}

+ (EEEInjector *)mapInjectionsForTest:(BOOL)test withInjector:(EEEInjector *)injector overwrite:(BOOL)overwrite
{
    [[injector mapClass:[UIApplication class] overwriteExisting:overwrite] toObject:[UIApplication sharedApplication]];

    XXCLASS_PREFIXXXTheme *theme = [XXCLASS_PREFIXXXTheme injectObject];
    [[injector mapClass:[TTTTheme class] overwriteExisting:overwrite] toObject:theme];
    [[injector mapClass:[XXCLASS_PREFIXXXTheme class] overwriteExisting:overwrite] toObject:theme];
    [TTTTheme setCurrentTheme:theme];
    [XXCLASS_PREFIXXXTheme setCurrentTheme:theme];

    [[injector mapClass:[UIWindow class] overwriteExisting:overwrite] toBlock:^{
        return [[UIApplication sharedApplication] keyWindow];
    }];

    [[injector mapClass:[NSDate class] overwriteExisting:overwrite] toBlock:^id {
        return [NSDate date];
    }];

    [[injector mapClass:[NSFileManager class] overwriteExisting:overwrite] toBlock:^id {
        return [NSFileManager defaultManager];
    }];

    [[injector mapClass:[NSNotificationCenter class] overwriteExisting:overwrite] toBlock:^id {
        return [NSNotificationCenter defaultCenter];
    }];

    if (test)
    {
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"Dressision Tests"];
        [defaults removePersistentDomainForName:@"Dressision Tests"];

        [[injector mapClass:[NSUserDefaults class] overwriteExisting:overwrite] toObject:defaults];
    }
    else
    {
        [[injector mapClass:[NSUserDefaults class] overwriteExisting:overwrite] toBlock:^{
            return [NSUserDefaults standardUserDefaults];
        }];
    }

    [[injector mapClass:[UINavigationController class] overwriteExisting:overwrite] toBlock:^{
        return [UIApplication sharedApplication].keyWindow.rootViewController;
    }];

    [[injector mapClass:[XXCLASS_PREFIXXXHTTPSessionManager class] overwriteExisting:overwrite] asSingleton];

    return injector;
}

+ (EEEInjector *)injectorForTest:(BOOL)test overwrite:(BOOL *)overwrite
{
    EEEInjector *injector;
    if (test)
    {
        *overwrite = [EEEInjector currentInjector] != nil;
        injector = [EEEInjector setCurrentInjector:[[EEEInjector alloc] init] force:YES];
    }
    else if (![EEEInjector currentInjector])
    {
        injector = [EEEInjector defaultCurrentInjector];
    }

    injector.allowImplicitMapping = YES;

    EEEOperationCenter *operationCenter = [[EEEOperationCenter alloc] initWithInjector:injector];
    [EEEOperationCenter setCurrentOperationCenter:operationCenter];
    [[injector mapClass:[EEEOperationCenter class] overwriteExisting:*overwrite] toObject:operationCenter];

    return injector;
}

@end