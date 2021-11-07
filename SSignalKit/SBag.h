#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBag : NSObject

- (NSInteger)addItem:(id _Nonnull)item;
- (void)enumerateItems:(void (^ _Nonnull)(id _Nonnull))block;
- (void)removeItem:(NSInteger)key;
- (bool)isEmpty;
- (NSArray * _Nonnull)copyItems;

@end

NS_ASSUME_NONNULL_END
