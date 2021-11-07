#import <SSignalKit/SDisposable.h>

NS_ASSUME_NONNULL_BEGIN

@class SSignal;

@interface SDisposableSet : NSObject <SDisposable>

- (void)add:(id<SDisposable> _Nonnull)disposable;
- (void)remove:(id<SDisposable> _Nonnull)disposable;

@end

NS_ASSUME_NONNULL_END
