#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SThreadPoolTask : NSObject

- (instancetype)initWithBlock:(void (^)(BOOL (^)(void)))block;
- (void)execute;
- (void)cancel;

@end

NS_ASSUME_NONNULL_END
