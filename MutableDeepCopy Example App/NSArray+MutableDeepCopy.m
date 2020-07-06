#import "NSArray+MutableDeepCopy.h"
#import "NSDictionary+MutableDeepCopy.h"

@implementation NSArray (MutableDeepCopy)

+ (NSMutableArray *)doDeepMutateArray:(NSArray *)array
{
    
    NSMutableArray *toReturn = [NSMutableArray arrayWithArray:array];
    
    for (id obj in array)
    {
        
        if ([obj isKindOfClass:[NSDictionary class]])
        {
            
            NSMutableDictionary *theNew = [NSMutableDictionary doDeepMutateDictionary:obj];
            
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

@end
