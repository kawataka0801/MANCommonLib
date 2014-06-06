//
//  NSString+EmoticonException.m
//  manacon
//
//  Created by kawakamin on 2014/04/03.
//  Copyright (c) 2014年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import "NSString+EmoticonException.h"

@implementation NSString (EmoticonException)

-(NSString*)removeEmoji
{
    __block NSMutableString* temp = [NSMutableString stringWithCapacity:[self length]];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop){
                              
                              const unichar high = [substring characterAtIndex: 0];
                              
                              // surrogate pair
                              if (0xd800 <= high && high <= 0xdbff) {
                                  const unichar low = [substring characterAtIndex: 1];
                                  const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
                                  
                                  [temp appendString: (0x1d000 <= codepoint && codepoint <= 0x1f77f)? @"": substring]; // U+1D000-1F77F
                                  
                                  // not surrogate pair
                              } else {
                                  [temp appendString: (0x2100 <= high && high <= 0x26ff)? @"": substring]; // U+2100-26FF
                              }
                          }
     ];
    return temp;
}


@end
