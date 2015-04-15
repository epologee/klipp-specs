//
//  Copyright (c) 2014 XXORGANIZATION_NAMEXX. All rights reserved.
//

int main(int argc, char *argv[]) {
    @autoreleasepool
    {
        BOOL runningTests = (NSClassFromString(@"XXCLASS_PREFIXXXTestsAppDelegate") != nil);
        if (runningTests)
        {
            return UIApplicationMain(argc, argv, nil, @"XXCLASS_PREFIXXXTestsAppDelegate");
        }

        return UIApplicationMain(argc, argv, nil, @"XXCLASS_PREFIXXXAppDelegate");
    }
}
