#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SSignal;

@interface SVariable : NSObject

- (instancetype)init;

- (void)set:(SSignal *)signal;
- (SSignal *)signal;

@end

NS_ASSUME_NONNULL_END
