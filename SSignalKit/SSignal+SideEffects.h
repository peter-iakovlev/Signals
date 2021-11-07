#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (SideEffects)

- (SSignal *)onStart:(void (^)(void))f;
- (SSignal *)onNext:(void (^)(id _Nullable next))f;
- (SSignal *)afterNext:(void (^)(id _Nullable next))f;
- (SSignal *)onError:(void (^)(id _Nullable error))f;
- (SSignal *)onCompletion:(void (^)(void))f;
- (SSignal *)afterCompletion:(void (^)(void))f;
- (SSignal *)onDispose:(void (^)(void))f;

@end

NS_ASSUME_NONNULL_END
