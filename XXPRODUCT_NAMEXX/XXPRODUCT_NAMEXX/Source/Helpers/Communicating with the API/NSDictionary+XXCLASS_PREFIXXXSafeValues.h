#import <Foundation/Foundation.h>

@interface NSDictionary (XXCLASS_PREFIXXXSafeValues)

- (NSNumber *)XXCATEGORY_METHOD_PREFIXXX_safeIntegerNumberForKey:(NSString *)key;

- (NSString *)XXCATEGORY_METHOD_PREFIXXX_safeStringForKey:(NSString *)key;

- (NSURL *)XXCATEGORY_METHOD_PREFIXXX_safeURLForKey:(NSString *)key;

- (NSArray *)XXCATEGORY_METHOD_PREFIXXX_safeArrayForKey:(NSString *)key;

- (NSDictionary *)XXCATEGORY_METHOD_PREFIXXX_safeDictionaryForKey:(NSString *)key;

- (id)XXCATEGORY_METHOD_PREFIXXX_safeObjectForKey:(NSString *)key;

@end