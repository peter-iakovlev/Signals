#if __IPHONE_OS_VERSION_MIN_REQUIRED
#import <UIKit/UIKit.h>
#else
#import <Foundation/Foundation.h>
#endif
#import <XCTest/XCTest.h>

#import <libkern/OSAtomic.h>

#import <SSignalKit/SSignalKit.h>

#import "DeallocatingObject.h"

@interface SDisposableTests : XCTestCase

@end

@implementation SDisposableTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testBlockDisposableDisposed
{
    BOOL deallocated = NO;
    __block BOOL disposed = NO;
    {
        DeallocatingObject *object = [[DeallocatingObject alloc] initWithDeallocated:&deallocated];
        dispatch_block_t block = ^{
            [object description];
            disposed = YES;
        };
        SBlockDisposable *disposable = [[SBlockDisposable alloc] initWithBlock:[block copy]];
        object = nil;
        block = nil;
        [disposable dispose];
    }
    
    XCTAssertTrue(deallocated);
    XCTAssertTrue(disposed);
}

- (void)testBlockDisposableNotDisposed
{
    BOOL deallocated = NO;
    __block BOOL disposed = NO;
    {
        DeallocatingObject *object = [[DeallocatingObject alloc] initWithDeallocated:&deallocated];
        dispatch_block_t block = ^{
            [object description];
            disposed = YES;
        };
        SBlockDisposable *disposable = [[SBlockDisposable alloc] initWithBlock:[block copy]];
        [disposable description];
    }
    
    XCTAssertTrue(deallocated);
    XCTAssertFalse(disposed);
}

- (void)testMetaDisposableDisposed
{
    BOOL deallocated = NO;
    __block BOOL disposed = NO;
    {
        DeallocatingObject *object = [[DeallocatingObject alloc] initWithDeallocated:&deallocated];
        dispatch_block_t block = ^{
            [object description];
            disposed = YES;
        };
        SBlockDisposable *blockDisposable = [[SBlockDisposable alloc] initWithBlock:[block copy]];
        
        SMetaDisposable *metaDisposable = [[SMetaDisposable alloc] init];
        [metaDisposable setDisposable:blockDisposable];
        [metaDisposable dispose];
    }
    
    XCTAssertTrue(deallocated);
    XCTAssertTrue(disposed);
}

- (void)testMetaDisposableDisposedMultipleTimes
{
    BOOL deallocated1 = NO;
    __block BOOL disposed1 = NO;
    BOOL deallocated2 = NO;
    __block BOOL disposed2 = NO;
    {
        DeallocatingObject *object1 = [[DeallocatingObject alloc] initWithDeallocated:&deallocated1];
        dispatch_block_t block1 = ^{
            [object1 description];
            disposed1 = YES;
        };
        SBlockDisposable *blockDisposable1 = [[SBlockDisposable alloc] initWithBlock:[block1 copy]];
        
        DeallocatingObject *object2 = [[DeallocatingObject alloc] initWithDeallocated:&deallocated2];
        dispatch_block_t block2 = ^{
            [object2 description];
            disposed2 = YES;
        };
        SBlockDisposable *blockDisposable2 = [[SBlockDisposable alloc] initWithBlock:[block2 copy]];
        
        SMetaDisposable *metaDisposable = [[SMetaDisposable alloc] init];
        [metaDisposable setDisposable:blockDisposable1];
        [metaDisposable setDisposable:blockDisposable2];
        [metaDisposable dispose];
    }
    
    XCTAssertTrue(deallocated1);
    XCTAssertTrue(disposed1);
    XCTAssertTrue(deallocated2);
    XCTAssertTrue(disposed2);
}

- (void)testMetaDisposableNotDisposed
{
    BOOL deallocated = NO;
    __block BOOL disposed = NO;
    {
        DeallocatingObject *object = [[DeallocatingObject alloc] initWithDeallocated:&deallocated];
        dispatch_block_t block = ^{
            [object description];
            disposed = YES;
        };
        SBlockDisposable *blockDisposable = [[SBlockDisposable alloc] initWithBlock:[block copy]];
        
        SMetaDisposable *metaDisposable = [[SMetaDisposable alloc] init];
        [metaDisposable setDisposable:blockDisposable];
    }
    
    XCTAssertTrue(deallocated);
    XCTAssertFalse(disposed);
}

- (void)testDisposableSetSingleDisposed
{
    BOOL deallocated = NO;
    __block BOOL disposed = NO;
    {
        DeallocatingObject *object = [[DeallocatingObject alloc] initWithDeallocated:&deallocated];
        dispatch_block_t block = ^{
            [object description];
            disposed = YES;
        };
        SBlockDisposable *blockDisposable = [[SBlockDisposable alloc] initWithBlock:[block copy]];
        
        SDisposableSet *disposableSet = [[SDisposableSet alloc] init];
        [disposableSet add:blockDisposable];
        [disposableSet dispose];
    }
    
    XCTAssertTrue(deallocated);
    XCTAssertTrue(disposed);
}

- (void)testDisposableSetMultipleDisposed
{
    BOOL deallocated1 = NO;
    __block BOOL disposed1 = NO;
    BOOL deallocated2 = NO;
    __block BOOL disposed2 = NO;
    {
        DeallocatingObject *object1 = [[DeallocatingObject alloc] initWithDeallocated:&deallocated1];
        dispatch_block_t block1 = ^{
            [object1 description];
            disposed1 = YES;
        };
        SBlockDisposable *blockDisposable1 = [[SBlockDisposable alloc] initWithBlock:[block1 copy]];
        
        DeallocatingObject *object2 = [[DeallocatingObject alloc] initWithDeallocated:&deallocated2];
        dispatch_block_t block2 = ^{
            [object2 description];
            disposed2 = YES;
        };
        SBlockDisposable *blockDisposable2 = [[SBlockDisposable alloc] initWithBlock:[block2 copy]];
        
        SDisposableSet *disposableSet = [[SDisposableSet alloc] init];
        [disposableSet add:blockDisposable1];
        [disposableSet add:blockDisposable2];
        [disposableSet dispose];
    }
    
    XCTAssertTrue(deallocated1);
    XCTAssertTrue(disposed1);
    XCTAssertTrue(deallocated2);
    XCTAssertTrue(disposed2);
}

- (void)testDisposableSetSingleNotDisposed
{
    BOOL deallocated = NO;
    __block BOOL disposed = NO;
    {
        DeallocatingObject *object = [[DeallocatingObject alloc] initWithDeallocated:&deallocated];
        dispatch_block_t block = ^{
            [object description];
            disposed = YES;
        };
        SBlockDisposable *blockDisposable = [[SBlockDisposable alloc] initWithBlock:[block copy]];
        
        SDisposableSet *disposableSet = [[SDisposableSet alloc] init];
        [disposableSet add:blockDisposable];
    }
    
    XCTAssertTrue(deallocated);
    XCTAssertFalse(disposed);
}

- (void)testDisposableSetMultipleNotDisposed
{
    BOOL deallocated1 = NO;
    __block BOOL disposed1 = NO;
    BOOL deallocated2 = NO;
    __block BOOL disposed2 = NO;
    {
        DeallocatingObject *object1 = [[DeallocatingObject alloc] initWithDeallocated:&deallocated1];
        dispatch_block_t block1 = ^{
            [object1 description];
            disposed1 = YES;
        };
        SBlockDisposable *blockDisposable1 = [[SBlockDisposable alloc] initWithBlock:[block1 copy]];
        
        DeallocatingObject *object2 = [[DeallocatingObject alloc] initWithDeallocated:&deallocated2];
        dispatch_block_t block2 = ^{
            [object2 description];
            disposed2 = YES;
        };
        SBlockDisposable *blockDisposable2 = [[SBlockDisposable alloc] initWithBlock:[block2 copy]];
        
        SDisposableSet *disposableSet = [[SDisposableSet alloc] init];
        [disposableSet add:blockDisposable1];
        [disposableSet add:blockDisposable2];
    }
    
    XCTAssertTrue(deallocated1);
    XCTAssertFalse(disposed1);
    XCTAssertTrue(deallocated2);
    XCTAssertFalse(disposed2);
}

- (void)testMetaDisposableAlreadyDisposed
{
    BOOL deallocated1 = NO;
    __block BOOL disposed1 = NO;
    BOOL deallocated2 = NO;
    __block BOOL disposed2 = NO;
    
    @autoreleasepool
    {
        DeallocatingObject *object1 = [[DeallocatingObject alloc] initWithDeallocated:&deallocated1];
        dispatch_block_t block1 = ^{
            [object1 description];
            disposed1 = YES;
        };
        SBlockDisposable *blockDisposable1 = [[SBlockDisposable alloc] initWithBlock:[block1 copy]];
        
        DeallocatingObject *object2 = [[DeallocatingObject alloc] initWithDeallocated:&deallocated2];
        dispatch_block_t block2 = ^{
            [object2 description];
            disposed2 = YES;
        };
        SBlockDisposable *blockDisposable2 = [[SBlockDisposable alloc] initWithBlock:[block2 copy]];
        
        SMetaDisposable *metaDisposable = [[SMetaDisposable alloc] init];
        [metaDisposable setDisposable:blockDisposable1];
        [metaDisposable dispose];
        [metaDisposable setDisposable:blockDisposable2];
    }
    
    XCTAssertTrue(deallocated1);
    XCTAssertTrue(disposed1);
    XCTAssertTrue(deallocated2);
    XCTAssertTrue(disposed2);
}

- (void)testDisposableSetAlreadyDisposed
{
    BOOL deallocated1 = NO;
    __block BOOL disposed1 = NO;
    BOOL deallocated2 = NO;
    __block BOOL disposed2 = NO;
    
    @autoreleasepool
    {
        DeallocatingObject *object1 = [[DeallocatingObject alloc] initWithDeallocated:&deallocated1];
        dispatch_block_t block1 = ^{
            [object1 description];
            disposed1 = YES;
        };
        SBlockDisposable *blockDisposable1 = [[SBlockDisposable alloc] initWithBlock:[block1 copy]];
        
        DeallocatingObject *object2 = [[DeallocatingObject alloc] initWithDeallocated:&deallocated2];
        dispatch_block_t block2 = ^{
            [object2 description];
            disposed2 = YES;
        };
        SBlockDisposable *blockDisposable2 = [[SBlockDisposable alloc] initWithBlock:[block2 copy]];
        
        SMetaDisposable *metaDisposable = [[SMetaDisposable alloc] init];
        [metaDisposable setDisposable:blockDisposable1];
        [metaDisposable dispose];
        [metaDisposable setDisposable:blockDisposable2];
    }
    
    XCTAssertTrue(deallocated1);
    XCTAssertTrue(disposed1);
    XCTAssertTrue(deallocated2);
    XCTAssertTrue(disposed2);
}

@end
