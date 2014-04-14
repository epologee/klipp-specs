#import "XXCLASS_PREFIXXXOperation.h"
#import "XXCLASS_PREFIXXXHTTPSessionManager.h"
#import "XXCLASS_PREFIXXXModelRepository.h"

@implementation XXCLASS_PREFIXXXOperation

@synthesize sessionManager = _sessionManager;
@synthesize rootNavigationController = _rootNavigationController;
@synthesize sharedApplication = _sharedApplication;
@synthesize userDefaults = _userDefaults;
@synthesize modelRepository = _modelRepository;

- (XXCLASS_PREFIXXXHTTPSessionManager *)sessionManager
{
    if (!_sessionManager)
    {
        self.sessionManager = [XXCLASS_PREFIXXXHTTPSessionManager injectObject];
    }

    return _sessionManager;
}

- (UINavigationController *)rootNavigationController
{
    if (!_rootNavigationController)
    {
        self.rootNavigationController = [UINavigationController injectObject];
    }

    return _rootNavigationController;
}

- (UIApplication *)sharedApplication
{
    if (!_sharedApplication)
    {
        self.sharedApplication = [UIApplication injectObject];
    }

    return _sharedApplication;
}

- (NSUserDefaults *)userDefaults
{
    if (!_userDefaults)
    {
        self.userDefaults = [NSUserDefaults injectObject];
    }

    return _userDefaults;
}

- (XXCLASS_PREFIXXXModelRepository *)modelRepository
{
    if (!_modelRepository)
    {
        self.modelRepository = [XXCLASS_PREFIXXXModelRepository injectObject];
    }

    return _modelRepository;
}

@end