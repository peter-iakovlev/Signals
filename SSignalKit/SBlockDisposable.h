#import <SSignalKit/SDisposable.h>

@interface SBlockDisposable : NSObject <SDisposable>

- (instancetype)initWithBlock:(void (^)(void))block;

@end
