#import <SSignalKit/SSubscriber.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSignal : NSObject
{
@public
    id<SDisposable> _Nullable (^ _generator)(SSubscriber *);
}

- (instancetype)initWithGenerator:(id<SDisposable> _Nullable (^)(SSubscriber *))generator;

- (id<SDisposable> _Nullable)startWithNext:(void (^ _Nullable)(id _Nullable next))next error:(void (^ _Nullable)(id _Nullable error))error completed:(void (^ _Nullable)(void))completed;
- (id<SDisposable> _Nullable)startWithNext:(void (^ _Nullable)(id _Nullable next))next;
- (id<SDisposable> _Nullable)startWithNext:(void (^ _Nullable)(id _Nullable next))next completed:(void (^ _Nullable)(void))completed;

- (SSignal *)trace:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
