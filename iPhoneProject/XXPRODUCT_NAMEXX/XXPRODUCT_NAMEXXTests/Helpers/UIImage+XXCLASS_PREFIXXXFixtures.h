#import <Foundation/Foundation.h>

/**
* This category method swizzles the `imageNamed:` method
* and looks for the requested image in the bundle of the
* XXPRODUCT_NAMEXXTest target.
*
* Just call the `[UIImage imageNamed:@"some_image.png"]`
* as you're used to. Make sure you don't add this
* category to your main app's target at any point.
*/
@interface UIImage (XXCLASS_PREFIXXXFixtures)
@end