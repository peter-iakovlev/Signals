#import <SSignalKit/SSignal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal (Mapping)

- (SSignal * _Nonnull)map:(id _Nullable (^ _Nonnull)(id _Nullable))f;
- (SSignal * _Nonnull)filter:(bool (^ _Nonnull)(id _Nullable))f;
- (SSignal * _Nonnull)ignoreRepeated;

@end

NS_ASSUME_NONNULL_END
