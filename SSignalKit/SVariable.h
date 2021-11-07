#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SSignal;

@interface SVariable : NSObject

- (instancetype _Nonnull)init;

- (void)set:(SSignal * _Nonnull)signal;
- (SSignal * _Nonnull)signal;

@end

NS_ASSUME_NONNULL_END
