#import <SSignalKit/SDisposable.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBlockDisposable : NSObject <SDisposable>

- (instancetype _Nonnull)initWithBlock:(void (^ _Nullable)(void))block;

@end

NS_ASSUME_NONNULL_END
