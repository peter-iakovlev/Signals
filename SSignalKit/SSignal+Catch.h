#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Catch)

- (SSignal *)catch:(SSignal * (^ )(id _Nullable error))f;
- (SSignal *)restart;
- (SSignal *)retryIf:(bool (^)(id _Nullable error))predicate;

@end

NS_ASSUME_NONNULL_END
