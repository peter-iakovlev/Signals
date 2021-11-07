#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAtomic : NSObject

- (instancetype)initWithValue:(id _Nullable)value;
- (instancetype)initWithValue:(id _Nullable)value recursive:(bool)recursive;
- (id _Nullable)swap:(id _Nullable)newValue;
- (id _Nullable)value;
- (id _Nullable)modify:(id _Nullable (^)(id _Nullable))f;
- (id _Nullable)with:(id _Nullable (^)(id _Nullable))f;

@end

NS_ASSUME_NONNULL_END
