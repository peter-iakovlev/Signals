#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Accumulate)

- (SSignal *)reduceLeft:(id _Nullable)value with:(id _Nullable (^)(id _Nullable, id _Nullable))f;
- (SSignal *)reduceLeftWithPassthrough:(id _Nullable)value with:(id _Nullable (^)(id _Nullable, id _Nullable, void (^)(id _Nullable)))f;

@end

NS_ASSUME_NONNULL_END
