#import <SSignalKit/SSubscriber.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal : NSObject
{
@public
    id<SDisposable> _Nullable (^ _Nonnull _generator)(SSubscriber * _Nonnull);
}

- (instancetype _Nonnull)initWithGenerator:(id<SDisposable> _Nullable (^ _Nonnull)(SSubscriber * _Nonnull))generator;

- (id<SDisposable> _Nullable)startWithNext:(void (^ _Nullable)(id _Nullable next))next error:(void (^ _Nullable)(id _Nullable error))error completed:(void (^ _Nullable)(void))completed;
- (id<SDisposable> _Nullable)startWithNext:(void (^ _Nullable)(id _Nullable next))next;
- (id<SDisposable> _Nullable)startWithNext:(void (^ _Nullable)(id _Nullable next))next completed:(void (^ _Nullable)(void))completed;

- (SSignal * _Nonnull)trace:(NSString * _Nonnull)name;

@end

NS_ASSUME_NONNULL_END
