#import "UIImage+XXCLASS_PREFIXXXFixtures.h"
#import <objc/runtime.h>

@implementation UIImage (XXCLASS_PREFIXXXFixtures)

+ (void)load
{
    method_exchangeImplementations(class_getClassMethod(self, @selector(imageNamed:) ), class_getClassMethod(self, @selector(XXCATEGORY_METHOD_PREFIXXX_testBundleImageNamed:)));
}

+ (instancetype)XXCATEGORY_METHOD_PREFIXXX_testBundleImageNamed:(NSString *)imageName
{
    imageName = [imageName stringByDeletingPathExtension];
    NSBundle *bundle = [NSBundle bundleForClass:[[UIApplication sharedApplication].delegate class]];
    __block NSString *imagePath = nil;
    [@[@"png", @"jpg"] enumerateObjectsUsingBlock:^(NSString *extension, NSUInteger idx, BOOL *stop) {
        imagePath = [bundle pathForResource:imageName ofType:extension];
        if (imagePath != nil)
        {
            *stop = YES;
        }
    }];

    if (imagePath)
    {
        return [UIImage imageWithContentsOfFile:imagePath];
    }

    return [self XXCATEGORY_METHOD_PREFIXXX_testBundleImageNamed:imageName];
}

@end