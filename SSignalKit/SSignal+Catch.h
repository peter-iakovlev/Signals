#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Catch)

- (SSignal * _Nonnull)catch:(SSignal * _Nonnull (^ _Nonnull )(id _Nullable error))f;
- (SSignal * _Nonnull)restart;
- (SSignal * _Nonnull)retryIf:(bool (^ _Nonnull)(id _Nullable error))predicate;

@end

NS_ASSUME_NONNULL_END
