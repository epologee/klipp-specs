#import "XXCLASS_PREFIXXXFirstViewController.h"
#import "XXCLASS_PREFIXXXTheme.h"
#import <EEEInjector/EEEInjector.h>

@implementation XXCLASS_PREFIXXXFirstViewController

- (id)init
{
    self = [super init];

    if (self)
    {
        self.title = NSLocalizedString(@"FIRST_TITLE", @"XXPOD_NAMEXX");
    }

    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [[XXCLASS_PREFIXXXTheme injectObject] colorForStyle:XXCLASS_PREFIXXXColorApplicationTint];
}

@end