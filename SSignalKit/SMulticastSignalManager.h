#import <SSignalKit/SSignal.h>

@interface SMulticastSignalManager : NSObject

- (SSignal *)multicastedSignalForKey:(NSString *)key producer:(SSignal *(^)(void))producer;
- (void)startStandaloneSignalIfNotRunningForKey:(NSString *)key producer:(SSignal *(^)(void))producer;

- (SSignal *)multicastedPipeForKey:(NSString *)key;
- (void)putNext:(id)next toMulticastedPipeForKey:(NSString *)key;

@end
