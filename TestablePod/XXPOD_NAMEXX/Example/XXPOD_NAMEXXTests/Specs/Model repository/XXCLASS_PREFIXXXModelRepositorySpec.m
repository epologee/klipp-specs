#import <Kiwi/Kiwi.h>
#import "XXCLASS_PREFIXXXModelRepository.h"
#import "XXCLASS_PREFIXXXInjections.h"

SPEC_BEGIN(XXCLASS_PREFIXXXModelRepositorySpec)

        describe(@"XXCLASS_PREFIXXXModelRepository", ^{
            __block EEEInjector *injector;

            beforeEach(^{
                injector = [XXCLASS_PREFIXXXInjections mapTestInjections];
            });

            context(@"after alloc/init", ^{
                __block XXCLASS_PREFIXXXModelRepository *sut;

                beforeEach(^{
                    sut = [[XXCLASS_PREFIXXXModelRepository alloc] init];
                });

                pending(@"domain specific features", ^{

                });
            });
        });

        SPEC_END
