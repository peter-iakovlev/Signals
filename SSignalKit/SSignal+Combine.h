#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Combine)

+ (SSignal *)combineSignals:(NSArray *)signals;
+ (SSignal *)combineSignals:(NSArray *)signals withInitialStates:(NSArray * _Nullable)initialStates;

+ (SSignal *)mergeSignals:(NSArray *)signals;

@end

NS_ASSUME_NONNULL_END
