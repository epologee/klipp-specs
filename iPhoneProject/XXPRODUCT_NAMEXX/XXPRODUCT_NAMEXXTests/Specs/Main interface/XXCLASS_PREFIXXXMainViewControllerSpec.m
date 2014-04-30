#import <Kiwi/Kiwi.h>
#import "XXCLASS_PREFIXXXMainViewController.h"

SPEC_BEGIN(XXCLASS_PREFIXXXMainViewControllerSpec)

describe(@"XXCLASS_PREFIXXXMainViewController", ^{
    it(@"has a title", ^{
        XXCLASS_PREFIXXXMainViewController *sut = [[XXCLASS_PREFIXXXMainViewController alloc] init];
        [[sut.title should] equal:@"XXPRODUCT_NAMEXX"];
    });
});

SPEC_END
