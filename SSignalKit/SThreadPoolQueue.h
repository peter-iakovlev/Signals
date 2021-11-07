#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SThreadPool;
@class SThreadPoolTask;

@interface SThreadPoolQueue : NSObject

- (instancetype _Nonnull)initWithThreadPool:(SThreadPool * _Nonnull)threadPool;
- (void)addTask:(SThreadPoolTask * _Nonnull)task;
- (SThreadPoolTask * _Nullable)_popFirstTask;
- (bool)_hasTasks;

@end

NS_ASSUME_NONNULL_END
