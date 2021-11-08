#import <SSignalKit/SSignal.h>
#import <SSignalKit/SQueue.h>
#import <SSignalKit/SThreadPool.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Dispatch)

- (SSignal *)deliverOn:(SQueue *)queue;
- (SSignal *)deliverOnThreadPool:(SThreadPool *)threadPool;
- (SSignal *)startOn:(SQueue *)queue;
- (SSignal *)startOnThreadPool:(SThreadPool *)threadPool;
- (SSignal *)throttleOn:(SQueue *)queue delay:(NSTimeInterval)delay;

@end

NS_ASSUME_NONNULL_END
