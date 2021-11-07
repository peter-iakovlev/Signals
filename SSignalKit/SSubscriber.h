#import <SSignalKit/SDisposable.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSubscriber : NSObject <SDisposable>
{
}

- (instancetype)initWithNext:(void (^ _Nullable)(id _Nullable))next error:(void (^ _Nullable)(id _Nullable))error completed:(void (^ _Nullable)(void))completed;

- (void)_assignDisposable:(id<SDisposable> _Nullable)disposable;
- (void)_markTerminatedWithoutDisposal;

- (void)putNext:(id _Nullable)next;
- (void)putError:(id _Nullable)error;
- (void)putCompletion;

@end

@interface STracingSubscriber : SSubscriber

- (instancetype)initWithName:(NSString *)name next:(void (^ _Nullable)(id _Nullable))next error:(void (^ _Nullable)(id _Nullable))error completed:(void (^ _Nullable)(void))completed;

@end

NS_ASSUME_NONNULL_END
