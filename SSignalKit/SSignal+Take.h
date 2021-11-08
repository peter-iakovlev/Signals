#import <SSignalKit/SSignalKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Take)

- (SSignal *)take:(NSUInteger)count;
- (SSignal *)takeLast;
- (SSignal *)takeUntilReplacement:(SSignal *)replacement;

@end

NS_ASSUME_NONNULL_END
