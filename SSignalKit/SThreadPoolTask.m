#import "SThreadPoolTask.h"

@interface SThreadPoolTaskState : NSObject
{
    @public
    BOOL _cancelled;
}

@end

@implementation SThreadPoolTaskState

@end

@interface SThreadPoolTask ()
{
    void (^_block)(BOOL (^)(void));
    SThreadPoolTaskState *_state;
}

@end

@implementation SThreadPoolTask

- (instancetype)initWithBlock:(void (^)(BOOL (^)(void)))block
{
    self = [super init];
    if (self != nil)
    {
        _block = [block copy];
        _state = [[SThreadPoolTaskState alloc] init];
    }
    return self;
}

- (void)execute
{
    if (_state->_cancelled)
        return;
    
    SThreadPoolTaskState *state = _state;
    _block(^BOOL
    {
        return state->_cancelled;
    });
}

- (void)cancel
{
    _state->_cancelled = YES;
}

@end
