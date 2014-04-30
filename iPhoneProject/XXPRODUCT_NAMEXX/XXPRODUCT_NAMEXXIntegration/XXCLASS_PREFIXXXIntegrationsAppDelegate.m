#import "XXCLASS_PREFIXXXAppDelegate.h"
#import "XXCLASS_PREFIXXXInjections.h"

@interface XXCLASS_PREFIXXXIntegrationsAppDelegate : XXCLASS_PREFIXXXAppDelegate
@end

@implementation XXCLASS_PREFIXXXIntegrationsAppDelegate

- (EEEInjector *)prepareInjections
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window resignKeyWindow];
    self.window = nil;
    
    return [XXCLASS_PREFIXXXInjections mapTestInjections];
}

@end
