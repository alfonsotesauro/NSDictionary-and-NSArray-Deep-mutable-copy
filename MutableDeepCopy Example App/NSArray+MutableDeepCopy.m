#import "NSDictionary+MutableDeepCopy.h"

@implementation NSDictionary (MutableDeepCopy)

NSInteger count;
NSInteger count2;



+(NSMutableArray *)doDeepMutateArray:(NSArray *)array
{
    count2++;
    
    NSMutableArray *toReturn = [NSMutableArray arrayWithArray:array];
    
    for (id obj in array)
    {
        
        if ([obj isKindOfClass:[NSDictionary class]])
        {
            
            NSMutableDictionary *theNew = [self doDeepMutateDictionary:obj];
            
            [toReturn replaceObjectAtIndex:[array indexOfObject:obj] withObject:theNew];
        }
        else
            if ([obj isKindOfClass:[NSArray class]])
            {
                NSMutableArray *theNew = [self doDeepMutateArray:obj];
                
                [toReturn replaceObjectAtIndex:[array indexOfObject:obj] withObject:theNew];
                
            }
        
    }
    
    return toReturn;
    
}

+(NSMutableDictionary *)doDeepMutateDictionary:(NSDictionary *)dict
{
    count++;
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
                NSMutableArray *theNew = [self doDeepMutateArray:obj];
                
                [toReturn setValue:theNew forKey:key];
                
            }
        
    }];
    
    return toReturn;
    
}

@end