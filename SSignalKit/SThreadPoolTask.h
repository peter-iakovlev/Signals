#import <Foundation/Foundation.h>

@interface SThreadPoolTask : NSObject

- (instancetype _Nonnull)initWithBlock:(void (^ _Nonnull)(bool (^ _Nonnull)(void)))block;
- (void)execute;
- (void)cancel;

@end
