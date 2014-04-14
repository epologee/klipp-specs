#import <Foundation/Foundation.h>
#import "TTTTheme.h"
#import "EEEInjector.h"

typedef NS_ENUM(TTTColorStyle , XXCLASS_PREFIXXXColorStyle)
{
    XXCLASS_PREFIXXXColorUndetermined,
    XXCLASS_PREFIXXXColorDefault,
};

typedef NS_ENUM(TTTTextStyle , XXCLASS_PREFIXXXTextStyle)
{
    XXCLASS_PREFIXXXTextStyleUndertermined = -1,
    XXCLASS_PREFIXXXTextStyleDefault,

};

typedef NS_ENUM(TTTButtonStyle , XXCLASS_PREFIXXXButtonStyle)
{
    XXCLASS_PREFIXXXButtonStyleUndertermined = -1,
    XXCLASS_PREFIXXXButtonStyleDefault,
};

@interface XXCLASS_PREFIXXXTheme : TTTTheme <TTTTheme>
@end