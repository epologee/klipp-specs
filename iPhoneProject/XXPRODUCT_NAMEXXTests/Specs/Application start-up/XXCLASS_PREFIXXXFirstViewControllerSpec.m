#import <Kiwi/Kiwi.h>
#import "XXCLASS_PREFIXXXFirstViewController.h"

SPEC_BEGIN(XXCLASS_PREFIXXXFirstViewControllerSpec)

describe(@"XXCLASS_PREFIXXXFirstViewController", ^{
    it(@"has a title", ^{
        XXCLASS_PREFIXXXFirstViewController *sut = [[XXCLASS_PREFIXXXFirstViewController alloc] init];
        [[sut.title should] equal:@"XXPRODUCT_NAMEXX"];
    });
});

SPEC_END
