#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Single)

+ (SSignal *)single:(id _Nullable)next;
+ (SSignal *)fail:(id _Nullable)error;
+ (SSignal *)never;
+ (SSignal *)complete;

@end

NS_ASSUME_NONNULL_END
