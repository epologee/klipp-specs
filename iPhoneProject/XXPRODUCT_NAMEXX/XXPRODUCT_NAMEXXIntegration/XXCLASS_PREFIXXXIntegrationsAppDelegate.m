#import "XXCLASS_PREFIXXXAppDelegate.h"
#import "XXCLASS_PREFIXXXInjections.h"

@interface XXCLASS_PREFIXXXIntegrationsAppDelegate : XXCLASS_PREFIXXXAppDelegate
@end

@implementation XXCLASS_PREFIXXXIntegrationsAppDelegate

- (void)prepareInjections
{
    [XXCLASS_PREFIXXXInjections mapTestInjections];
}

@end
