//
//  main.m
//  XXPRODUCT_NAMEXX
//
//  Created by Eric-Paul Lecluse on 14-04-14.
//  Copyright (c) 2014 XXORGANIZATION_NAMEXX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XXCLASS_PREFIXXXAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        BOOL runningTests = (NSClassFromString(@"XXCLASS_PREFIXXXTestsAppDelegate") != nil);
        if (runningTests)
        {
            return UIApplicationMain(argc, argv, nil, @"XXCLASS_PREFIXXXTestsAppDelegate");
        }

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([XXCLASS_PREFIXXXAppDelegate class]));
    }
}
