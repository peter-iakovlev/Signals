#import <SSignalKit/SSignalKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Take)

- (SSignal * _Nonnull)take:(NSUInteger)count;
- (SSignal * _Nonnull)takeLast;
- (SSignal * _Nonnull)takeUntilReplacement:(SSignal * _Nonnull)replacement;

@end

NS_ASSUME_NONNULL_END
