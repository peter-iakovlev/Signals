#import <Foundation/Foundation.h>

@interface DeallocatingObject : NSObject

- (instancetype)initWithDeallocated:(BOOL *)deallocated;

@end
