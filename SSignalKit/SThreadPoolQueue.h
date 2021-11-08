#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SThreadPool;
@class SThreadPoolTask;

@interface SThreadPoolQueue : NSObject

- (instancetype)initWithThreadPool:(SThreadPool *)threadPool;
- (void)addTask:(SThreadPoolTask *)task;
- (SThreadPoolTask * _Nullable)_popFirstTask;
- (BOOL)_hasTasks;

@end

NS_ASSUME_NONNULL_END
