#import <SSignalKit/SSignalKit.h>

@interface SPipe : NSObject

@property (nonatomic, copy, readonly) SSignal *(^signalProducer)(void);
@property (nonatomic, copy, readonly) void (^sink)(id);

- (instancetype)initWithReplay:(bool)replay;

@end

