#import "XXCLASS_PREFIXXXTheme.h"
#import "UIImage+TTTDrawing.h"
#import "XXCLASS_PREFIXXXDesign.h"
#import "TTTLog.h"

@implementation XXCLASS_PREFIXXXTheme

- (UIColor *)colorForStyle:(TTTColorStyle)colorStyle
{
    switch ((XXCLASS_PREFIXXXColorStyle) colorStyle)
    {
        default:
            WLog(@"Undetermined style %li - falling back to XXCLASS_PREFIXXXColorUndetermined", (long) colorStyle);
        case XXCLASS_PREFIXXXColorUndetermined:
            return [UIColor redColor];
    }
}

- (NSMutableDictionary *)attributesForTextStyle:(TTTTextStyle)textStyle forControlState:(UIControlState)controlState
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:@{
            TTTAttributeTextColor : [self colorForStyle:XXCLASS_PREFIXXXColorDefault]
    }];

    switch ((XXCLASS_PREFIXXXTextStyle) textStyle)
    {
        default:
            WLog(@"Undetermined style %li - falling back to XXCLASS_PREFIXXXTextStyleUndertermined", (long) textStyle);
        case XXCLASS_PREFIXXXTextStyleUndertermined:
            attributes[TTTAttributeFont] = [UIFont boldSystemFontOfSize:20];
            break;
    }

    return attributes;
}

- (NSMutableDictionary *)attributesForButtonStyle:(TTTButtonStyle)buttonStyle withControlState:(UIControlState)controlState
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary:@{
            TTTAttributeTextStyle : @(XXCLASS_PREFIXXXTextStyleDefault)
    }];

    switch ((XXCLASS_PREFIXXXButtonStyle) buttonStyle)
    {
        default:
            WLog(@"Undetermined style %li - falling back to XXCLASS_PREFIXXXButtonStyleUndertermined", (long) buttonStyle);
        case XXCLASS_PREFIXXXButtonStyleUndertermined:
            attributes[TTTAttributeTitleColor] = [UIColor redColor];
            break;
    }

    return attributes;
}

@end