#import "DeallocatingObject.h"

@interface DeallocatingObject ()
{
    BOOL *_deallocated;
}

@end

@implementation DeallocatingObject

- (instancetype)initWithDeallocated:(BOOL *)deallocated
{
    self = [super init];
    if (self != nil)
    {
        _deallocated = deallocated;
    }
    return self;
}

- (void)dealloc
{
    *_deallocated = YES;
}

@end
