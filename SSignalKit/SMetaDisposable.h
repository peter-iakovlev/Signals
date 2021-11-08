#import <SSignalKit/SDisposable.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMetaDisposable : NSObject <SDisposable>

- (void)setDisposable:(id<SDisposable> _Nullable)disposable;

@end

NS_ASSUME_NONNULL_END
