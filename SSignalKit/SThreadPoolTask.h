#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SThreadPoolTask : NSObject

- (instancetype _Nonnull)initWithBlock:(void (^ _Nonnull)(bool (^ _Nonnull)(void)))block;
- (void)execute;
- (void)cancel;

@end

NS_ASSUME_NONNULL_END
