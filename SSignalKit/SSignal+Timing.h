#import <SSignalKit/SSignal.h>
#import <SSignalKit/SQueue.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Timing)

- (SSignal *)delay:(NSTimeInterval)seconds onQueue:(SQueue *)queue;
- (SSignal *)timeout:(NSTimeInterval)seconds onQueue:(SQueue *)queue orSignal:(SSignal *)signal;
- (SSignal *)wait:(NSTimeInterval)seconds;

@end

NS_ASSUME_NONNULL_END
