#import <SSignalKit/SDisposable.h>

NS_ASSUME_NONNULL_BEGIN

@class SSignal;

@interface SDisposableSet : NSObject <SDisposable>

- (void)add:(id<SDisposable>)disposable;
- (void)remove:(id<SDisposable>)disposable;

@end

NS_ASSUME_NONNULL_END
