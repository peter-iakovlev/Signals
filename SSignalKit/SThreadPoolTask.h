#import <Foundation/Foundation.h>

@interface SThreadPoolTask : NSObject

- (instancetype)initWithBlock:(void (^)(bool (^)(void)))block;
- (void)execute;
- (void)cancel;

@end
