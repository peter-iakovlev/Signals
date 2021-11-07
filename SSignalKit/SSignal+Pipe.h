#import <SSignalKit/SSignalKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPipe : NSObject

@property (nonatomic, copy, readonly) SSignal * _Nonnull (^ _Nonnull signalProducer)(void);
@property (nonatomic, copy, readonly) void (^ _Nonnull sink)(id _Nullable);

- (instancetype _Nonnull)initWithReplay:(bool)replay;

@end

NS_ASSUME_NONNULL_END
