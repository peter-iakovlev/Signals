#import "SMetaDisposable.h"

#import <libkern/OSAtomic.h>

@interface SMetaDisposable ()
{
    OSSpinLock _lock;
    BOOL _disposed;
    id<SDisposable> _disposable;
}

@end

@implementation SMetaDisposable

- (void)setDisposable:(id<SDisposable>)disposable
{
    id<SDisposable> previousDisposable = nil;
    BOOL dispose = NO;
    
    OSSpinLockLock(&_lock);
    dispose = _disposed;
    if (!dispose)
    {
        previousDisposable = _disposable;
        _disposable = disposable;
    }
    OSSpinLockUnlock(&_lock);
    
    if (previousDisposable != nil)
        [previousDisposable dispose];
    
    if (dispose)
        [disposable dispose];
}

- (void)dispose
{
    id<SDisposable> disposable = nil;
    
    OSSpinLockLock(&_lock);
    if (!_disposed)
    {
        disposable = _disposable;
        _disposed = YES;
    }
    OSSpinLockUnlock(&_lock);
    
    if (disposable != nil)
        [disposable dispose];
}

@end
