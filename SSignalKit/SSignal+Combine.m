#import "SSignal+Combine.h"

#import "SAtomic.h"
#import "SDisposableSet.h"
#import "SSignal+Single.h"

@interface SSignalCombineState : NSObject

@property (nonatomic, strong, readonly) NSDictionary *latestValues;
@property (nonatomic, strong, readonly) NSArray *completedStatuses;
@property (nonatomic) BOOL error;

@end

@implementation SSignalCombineState

- (instancetype)initWithLatestValues:(NSDictionary *)latestValues completedStatuses:(NSArray *)completedStatuses error:(BOOL)error
{
    self = [super init];
    if (self != nil)
    {
        _latestValues = latestValues;
        _completedStatuses = completedStatuses;
        _error = error;
    }
    return self;
}

@end

@implementation SSignal (Combine)

+ (SSignal *)combineSignals:(NSArray *)signals
{
    if (signals.count == 0)
        return [SSignal single:@[]];
    else
        return [self combineSignals:signals withInitialStates:nil];
}

+ (SSignal *)combineSignals:(NSArray *)signals withInitialStates:(NSArray *)initialStates
{
    return [[SSignal alloc] initWithGenerator:^(SSubscriber *subscriber)
    {
        NSMutableArray *completedStatuses = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < signals.count; i++)
        {
            [completedStatuses addObject:@NO];
        }
        NSMutableDictionary *initialLatestValues = [[NSMutableDictionary alloc] init];
        for (NSUInteger i = 0; i < initialStates.count; i++)
        {
            initialLatestValues[@(i)] = initialStates[i];
        }
        SAtomic *combineState = [[SAtomic alloc] initWithValue:[[SSignalCombineState alloc] initWithLatestValues:initialLatestValues completedStatuses:completedStatuses error:NO]];
        
        SDisposableSet *compositeDisposable = [[SDisposableSet alloc] init];
        
        NSUInteger index = 0;
        NSUInteger count = signals.count;
        for (SSignal *signal in signals)
        {
            id<SDisposable> disposable = [signal startWithNext:^(id next)
            {
                SSignalCombineState *currentState = [combineState modify:^id(SSignalCombineState *state)
                {
                    NSMutableDictionary *latestValues = [[NSMutableDictionary alloc] initWithDictionary:state.latestValues];
                    latestValues[@(index)] = next;
                    return [[SSignalCombineState alloc] initWithLatestValues:latestValues completedStatuses:state.completedStatuses error:state.error];
                }];
                NSMutableArray *latestValues = [[NSMutableArray alloc] init];
                for (NSUInteger i = 0; i < count; i++)
                {
                    id value = currentState.latestValues[@(i)];
                    if (value == nil)
                    {
                        latestValues = nil;
                        break;
                    }
                    latestValues[i] = value;
                }
                if (latestValues != nil)
                    [subscriber putNext:latestValues];
            }
            error:^(id error)
            {
                __block BOOL hadError = NO;
                [combineState modify:^id(SSignalCombineState *state)
                {
                    hadError = state.error;
                    return [[SSignalCombineState alloc] initWithLatestValues:state.latestValues completedStatuses:state.completedStatuses error:YES];
                }];
                if (!hadError)
                    [subscriber putError:error];
            } completed:^
            {
                __block BOOL wasCompleted = NO;
                __block BOOL isCompleted = NO;
                [combineState modify:^id(SSignalCombineState *state)
                {
                    NSMutableArray *completedStatuses = [[NSMutableArray alloc] initWithArray:state.completedStatuses];
                    BOOL everyStatusWasCompleted = YES;
                    for (NSNumber *nStatus in completedStatuses)
                    {
                        if (![nStatus boolValue])
                        {
                            everyStatusWasCompleted = NO;
                            break;
                        }
                    }
                    completedStatuses[index] = @YES;
                    BOOL everyStatusIsCompleted = YES;
                    for (NSNumber *nStatus in completedStatuses)
                    {
                        if (![nStatus boolValue])
                        {
                            everyStatusIsCompleted = NO;
                            break;
                        }
                    }
                    
                    wasCompleted = everyStatusWasCompleted;
                    isCompleted = everyStatusIsCompleted;
                    
                    return [[SSignalCombineState alloc] initWithLatestValues:state.latestValues completedStatuses:completedStatuses error:state.error];
                }];
                if (!wasCompleted && isCompleted)
                    [subscriber putCompletion];
            }];
            [compositeDisposable add:disposable];
            index++;
        }
        
        return compositeDisposable;
    }];
}

+ (SSignal *)mergeSignals:(NSArray *)signals
{
    if (signals.count == 0)
        return [SSignal complete];
    
    return [[SSignal alloc] initWithGenerator:^id<SDisposable>(SSubscriber *subscriber)
    {
        SDisposableSet *disposables = [[SDisposableSet alloc] init];
        SAtomic *completedStates = [[SAtomic alloc] initWithValue:[[NSSet alloc] init]];
        
        NSInteger index = -1;
        NSUInteger count = signals.count;
        for (SSignal *signal in signals)
        {
            index++;
            
            id<SDisposable> disposable = [signal startWithNext:^(id next)
            {
                [subscriber putNext:next];
            } error:^(id error)
            {
                [subscriber putError:error];
            } completed:^
            {
                NSSet *set = [completedStates modify:^id(NSSet *set)
                {
                    return [set setByAddingObject:@(index)];
                }];
                if (set.count == count)
                    [subscriber putCompletion];
            }];
            
            [disposables add:disposable];
        }
        
        return disposables;
    }];
}

@end
