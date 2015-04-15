#import <Kiwi/Kiwi.h>
#import "NSError+XXCLASS_PREFIXXXErrors.h"

SPEC_BEGIN(NSError_BNCErrorsSpec)

        describe(@"NSError+XXCLASS_PREFIXXXErrors", ^{
            it(@"sets the error code", ^{
                NSError *sut = [NSError XXCATEGORY_METHOD_PREFIXXX_errorWithClass:[self class] code:100];
                [[theValue(sut.code) should] equal:theValue(100)];
            });

            it(@"puts the localized description into the userInfo dictionary", ^{
                NSError *sut = [NSError XXCATEGORY_METHOD_PREFIXXX_errorWithClass:[self class] code:100 description:@"this went horribly wrong"];
                [[sut.localizedDescription should] equal:@"this went horribly wrong"];
            });

            it(@"(de)serializes the status code from/into the userInfo dictionary", ^{
                NSError *sut = [NSError XXCATEGORY_METHOD_PREFIXXX_errorWithClass:[self class] code:100 httpStatusCode:404];
                [[theValue(sut.XXCATEGORY_METHOD_PREFIXXX_httpStatusCode) should] equal:theValue(404)];
            });

            it(@"conveniently creates an alert view for displaying to the user", ^{
                NSError *sut = [NSError XXCATEGORY_METHOD_PREFIXXX_errorWithClass:[self class] code:100];
                UIAlertView *alertView = sut.XXCATEGORY_METHOD_PREFIXXX_alertView;
                [[alertView.title should] equal:@"An error has occurred"];
                [[alertView.message should] equal:sut.localizedDescription];
            });
        });

        SPEC_END
