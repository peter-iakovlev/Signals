#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Accumulate)

- (SSignal * _Nonnull)reduceLeft:(id _Nullable)value with:(id _Nullable (^ _Nonnull)(id _Nullable, id _Nullable))f;
- (SSignal * _Nonnull)reduceLeftWithPassthrough:(id _Nullable)value with:(id _Nullable (^ _Nonnull)(id _Nullable, id _Nullable, void (^ _Nonnull)(id _Nullable)))f;

@end

NS_ASSUME_NONNULL_END
