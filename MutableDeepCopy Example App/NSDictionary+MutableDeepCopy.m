#import "NSDictionary+MutableDeepCopy.h"
#import "NSArray+MutableDeepCopy.h"

@implementation NSDictionary (MutableDeepCopy)

+ (NSMutableDictionary *)doDeepMutateDictionary:(NSDictionary *)dict {
    
    NSMutableDictionary *toReturn = [NSMutableDictionary dictionaryWithDictionary:dict];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        
        if ([obj isKindOfClass:[NSDictionary class]])
        {
            
            NSMutableDictionary *testg = [self doDeepMutateDictionary:obj];
            [toReturn setValue:testg forKey:key];
        }
        else
            if ([obj isKindOfClass:[NSArray class]])
            {
                NSMutableArray *theNew = [NSMutableArray doDeepMutateArray:obj];
                
                [toReturn setValue:theNew forKey:key];
                
            }
        
    }];
    
    return toReturn;
    
}

@end
