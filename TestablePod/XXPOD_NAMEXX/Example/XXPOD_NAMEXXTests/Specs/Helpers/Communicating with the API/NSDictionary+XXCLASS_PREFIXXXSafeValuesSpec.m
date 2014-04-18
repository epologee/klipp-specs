#import <Kiwi/Kiwi.h>
#import "NSDictionary+XXCLASS_PREFIXXXSafeValues.h"

SPEC_BEGIN(NSDictionary_XXCLASS_PREFIXXXSafeValuesSpec)

        describe(@"NSDictionary+XXCLASS_PREFIXXXSafeValues", ^{
            __block NSDictionary *fixture;

            context(@"integers", ^{
                beforeEach(^{
                    fixture = @{
                            @"a" : @1,
                            @"b" : @"2",
                            @"c" : @"3D",
                            @"d" : [NSNull null],
                            @"e" : @0,
                    };
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeIntegerNumberForKey:@"a"] should] equal:@1];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeIntegerNumberForKey:@"b"] should] equal:@2];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeIntegerNumberForKey:@"c"] should] equal:@3];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeIntegerNumberForKey:@"d"] should] beNil];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeIntegerNumberForKey:@"e"] should] equal:@0];
                });
            });

            context(@"strings", ^{
                beforeEach(^{
                    fixture = @{
                            @"a" : @1,
                            @"b" : @"2",
                            @"c" : @"3D",
                            @"d" : [NSNull null],
                            @"e" : @[@"strange", @"strings", @"happen"],
                    };
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeStringForKey:@"a"] should] equal:@"1"];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeStringForKey:@"b"] should] equal:@"2"];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeStringForKey:@"c"] should] equal:@"3D"];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeStringForKey:@"d"] should] beNil];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeStringForKey:@"e"] should] beKindOfClass:[NSString class]];
                });
            });

            context(@"urls", ^{
                beforeEach(^{
                    fixture = @{
                            @"a" : @"http://acdme.nl",
                            @"b" : @"http://epologee.com?all=things%20attached",
                            @"c" : [NSNull null],
                            @"d" : @1,
                            @"e" : @[@"not",@"a",@"valid",@"url"]
                    };
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeURLForKey:@"a"] should] equal:[NSURL URLWithString:@"http://acdme.nl"]];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeURLForKey:@"b"] should] equal:[NSURL URLWithString:@"http://epologee.com?all=things%20attached"]];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeURLForKey:@"c"] should] beNil];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeURLForKey:@"d"] should] equal:[NSURL URLWithString:@"1"]];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeURLForKey:@"e"] should] beNil];
                });
            });

            context(@"arrays", ^{
                beforeEach(^{
                    fixture = @{
                            @"a" : @[@1, @2, @3],
                            @"b" : @[@{@"nested":@"dictinoary"}],
                            @"c" : [NSNull null],
                            @"d" : @1,
                            @"e" : @"textual",
                            @"f" : @{@"not":@"array"}
                    };
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeArrayForKey:@"a"] should] equal:@[@1, @2, @3]];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeArrayForKey:@"b"] should] equal:@[@{@"nested":@"dictinoary"}]];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeArrayForKey:@"c"] should] beNil];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeArrayForKey:@"d"] should] beNil];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeArrayForKey:@"e"] should] beNil];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeArrayForKey:@"f"] should] beNil];
                });
            });

            context(@"dictionaries", ^{
                beforeEach(^{
                    fixture = @{
                            @"a" : @{@"a":@"dictionary"},
                            @"b" : @{@"a":@[@"nested", @"array"]},
                            @"c" : [NSNull null],
                            @"d" : @1,
                            @"e" : @"textual",
                            @"f" : @[@"not",@"a",@"dictionary"]
                    };
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeDictionaryForKey:@"a"] should] equal:@{@"a":@"dictionary"}];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeDictionaryForKey:@"b"] should] equal:@{@"a":@[@"nested", @"array"]}];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeDictionaryForKey:@"c"] should] beNil];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeDictionaryForKey:@"d"] should] beNil];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeDictionaryForKey:@"e"] should] beNil];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeDictionaryForKey:@"f"] should] beNil];
                });
            });

            context(@"objects", ^{
                beforeEach(^{
                    fixture = @{
                            @"a" : @{@"a":@"dictionary"},
                            @"b" : @{@"a":@[@"nested", @"array"]},
                            @"c" : [NSNull null],
                            @"d" : @1,
                            @"e" : @"textual"
                    };
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeObjectForKey:@"a"] should] equal:@{@"a":@"dictionary"}];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeObjectForKey:@"b"] should] equal:@{@"a":@[@"nested", @"array"]}];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeObjectForKey:@"c"] should] beNil];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeObjectForKey:@"d"] should] equal:@1];
                });

                specify(^{
                    [[[fixture XXCATEGORY_METHOD_PREFIXXX_safeObjectForKey:@"e"] should] equal:@"textual"];
                });
            });
        });

        SPEC_END
