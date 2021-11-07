#import <SSignalKit/SSignalKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPipe : NSObject

@property (nonatomic, copy, readonly) SSignal * (^ signalProducer)(void);
@property (nonatomic, copy, readonly) void (^ sink)(id _Nullable);

- (instancetype)initWithReplay:(bool)replay;

@end

NS_ASSUME_NONNULL_END
