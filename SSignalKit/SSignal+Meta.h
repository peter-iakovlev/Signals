#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@class SQueue;

@interface SSignal (Meta)

- (SSignal *)switchToLatest;
- (SSignal *)mapToSignal:(SSignal * (^)(id _Nullable))f;
- (SSignal *)mapToQueue:(SSignal * (^)(id _Nullable))f;
- (SSignal *)mapToThrottled:(SSignal * (^)(id _Nullable))f;
- (SSignal *)then:(SSignal *)signal;
- (SSignal *)queue;
- (SSignal *)throttled;
+ (SSignal *)defer:(SSignal *(^)(void))generator;

@end

@interface SSignalQueue : NSObject

- (SSignal *)enqueue:(SSignal *)signal;

@end

NS_ASSUME_NONNULL_END
