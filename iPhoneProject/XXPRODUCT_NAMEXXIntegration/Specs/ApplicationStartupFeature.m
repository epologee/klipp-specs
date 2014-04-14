#import "KWSpec+KIFAdditions.h"

SPEC_BEGIN(ApplicationStartupFeature)

describe(@"Application startup", ^{
    it(@"shows the first view controller", ^{
        [tester waitForViewWithAccessibilityLabel:@"XXPRODUCT_NAMEXX"];
    });
});

SPEC_END
