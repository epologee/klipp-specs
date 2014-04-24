#import <Foundation/Foundation.h>
#import "EEEOperation.h"

@class XXCLASS_PREFIXXXHTTPSessionManager;
@class XXCLASS_PREFIXXXModelRepository;

@protocol XXCLASS_PREFIXXXOperation

@property(nonatomic, strong) XXCLASS_PREFIXXXHTTPSessionManager *sessionManager;
@property(nonatomic, strong) UINavigationController *rootNavigationController;
@property(nonatomic, strong) UIApplication *sharedApplication;
@property(nonatomic, strong) NSUserDefaults *userDefaults;
@property(nonatomic, strong) XXCLASS_PREFIXXXModelRepository *modelRepository;
@property(nonatomic, copy) NSDate *now;

@end

@interface XXCLASS_PREFIXXXOperation : EEEOperation <XXCLASS_PREFIXXXOperation>
@end