#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SQueue;

@interface STimer : NSObject

- (instancetype)initWithTimeout:(NSTimeInterval)timeout repeat:(bool)repeat completion:(dispatch_block_t)completion queue:(SQueue *)queue;
- (instancetype)initWithTimeout:(NSTimeInterval)timeout repeat:(bool)repeat completion:(dispatch_block_t)completion nativeQueue:(dispatch_queue_t)nativeQueue;

- (void)start;
- (void)invalidate;
- (void)fireAndInvalidate;

@end

NS_ASSUME_NONNULL_END
