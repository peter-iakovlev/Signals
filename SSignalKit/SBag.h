#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBag : NSObject

- (NSInteger)addItem:(id)item;
- (void)enumerateItems:(void (^)(id))block;
- (void)removeItem:(NSInteger)key;
- (BOOL)isEmpty;
- (NSArray *)copyItems;

@end

NS_ASSUME_NONNULL_END
