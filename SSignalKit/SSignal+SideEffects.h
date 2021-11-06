#import <SSignalKit/SSignal.h>

@interface SSignal (SideEffects)

- (SSignal *)onStart:(void (^)(void))f;
- (SSignal *)onNext:(void (^)(id next))f;
- (SSignal *)afterNext:(void (^)(id next))f;
- (SSignal *)onError:(void (^)(id error))f;
- (SSignal *)onCompletion:(void (^)(void))f;
- (SSignal *)afterCompletion:(void (^)(void))f;
- (SSignal *)onDispose:(void (^)(void))f;

@end
