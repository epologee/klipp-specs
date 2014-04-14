#import "NSDictionary+XXCLASS_PREFIXXXSafeValues.h"

@implementation NSDictionary (XXCLASS_PREFIXXXSafeValues)

- (NSNumber *)XXCATEGORY_METHOD_PREFIXXX_safeIntegerNumberForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (object == nil || [object isKindOfClass:[NSNull class]]) return nil;
    return [NSNumber numberWithInteger:[object integerValue]];
}

- (NSString *)XXCATEGORY_METHOD_PREFIXXX_safeStringForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (object == nil || [object isKindOfClass:[NSNull class]]) return nil;
    return [NSString stringWithFormat:@"%@", object];
}

- (NSURL *)XXCATEGORY_METHOD_PREFIXXX_safeURLForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (object == nil || [object isKindOfClass:[NSNull class]]) return nil;
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@", object]];
}

- (NSArray *)XXCATEGORY_METHOD_PREFIXXX_safeArrayForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSArray class]]) return object;
    return nil;
}

- (NSDictionary *)XXCATEGORY_METHOD_PREFIXXX_safeDictionaryForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSDictionary class]]) return object;
    return nil;
}

- (id)XXCATEGORY_METHOD_PREFIXXX_safeObjectForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (object && [NSNull null] != object) return object;
    return nil;
}

@end