#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMulticastSignalManager : NSObject

- (SSignal *)multicastedSignalForKey:(NSString *)key producer:(SSignal * (^)(void))producer;
- (void)startStandaloneSignalIfNotRunningForKey:(NSString *)key producer:(SSignal * (^)(void))producer;

- (SSignal *)multicastedPipeForKey:(NSString *)key;
- (void)putNext:(id _Nullable)next toMulticastedPipeForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
