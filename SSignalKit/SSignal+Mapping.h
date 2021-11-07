#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Mapping)

- (SSignal *)map:(id _Nullable (^)(id _Nullable))f;
- (SSignal *)filter:(bool (^)(id _Nullable))f;
- (SSignal *)ignoreRepeated;

@end

NS_ASSUME_NONNULL_END
