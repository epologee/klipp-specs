#import "XXCLASS_PREFIXXXMainViewController.h"
#import "XXCLASS_PREFIXXXTheme.h"
#import <EEEInjector/EEEInjector.h>

@implementation XXCLASS_PREFIXXXMainViewController

- (id)init
{
    self = [super init];

    if (self)
    {
        self.title = NSLocalizedString(@"FIRST_TITLE", @"XXPRODUCT_NAMEXX");
    }

    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [[XXCLASS_PREFIXXXTheme injectObject] colorForStyle:XXCLASS_PREFIXXXColorApplicationTint];
}

@end