//
//  Encode.m
//  Base64+rc4
//
//  Created by han on 2017/8/24.
//  Copyright © 2017年 han. All rights reserved.
//

#import "EncodeControl.h"
#include "rc4Encode.h"
#include "base64.h"

@implementation EncodeControl

+ (NSString *)encode:(NSString *)data key:(NSString *)key isBase64:(BOOL)isBase64 {
    
    unsigned long rc4_data_len = 0;
    int base64_data_len = 0;
    
    const char *pwd = [key UTF8String];
    
    const char * cData = [data UTF8String];
    rc4_data_len = (int)strlen(cData);
    char *outdata = (char*)calloc(rc4_data_len, 1);
    Transform(pwd, (int)key.length, outdata, cData, (int)rc4_data_len);
    
    if (isBase64) {
        
        base64_data_len = Base64encode_len((int)rc4_data_len);
        char *base64_data = (char*)malloc(base64_data_len);
        memset(base64_data, 0, base64_data_len);
        Base64encode(base64_data, outdata, (int)rc4_data_len);
        base64_data_len = (int)strlen(base64_data);
        
        NSString *str = [NSString stringWithCString:base64_data encoding:NSUTF8StringEncoding];
        return str;
    } else {
        NSData *adata = [[NSData alloc] initWithBytes:outdata length:strlen(outdata)];
        NSString *str = [self hexStringFromData:adata];
        
        return str;
    }
    
}

+ (NSString *)decode:(NSString *)data key:(NSString *)key isBase64:(BOOL)isBase64 {
    
    if (isBase64) {
        
        char *rc4_data = NULL;
        int rc4_data_len = 0;
        const char * base64_data = [data UTF8String];
        const char *pwd = [key UTF8String];

        rc4_data_len = Base64decode_len(base64_data);
        rc4_data_len = (int)strlen(base64_data);
        rc4_data = (char*)malloc(rc4_data_len);
        memset(rc4_data, 0, rc4_data_len);
        rc4_data_len = Base64decode(rc4_data, base64_data);
        char *outdata = (char*)calloc(rc4_data_len + 1, 1);

        Transform(pwd, (int)key.length, outdata, rc4_data, rc4_data_len);
        outdata[rc4_data_len] = 0;
        NSString *str = [NSString stringWithCString:outdata encoding:NSUTF8StringEncoding];
        
        return str;
        
    } else {
        
        NSData *tenData = [self convertHexStrToData:data];
    
        const char * rc4_data = [tenData bytes];
        const char *key_data = [key UTF8String];
        unsigned long  rc4_data_len = tenData.length;
        char *outdata = (char*)calloc(strlen(rc4_data) + 1, 1);
    
        Transform(key_data, (int)key.length, outdata, rc4_data, rc4_data_len);
        outdata[rc4_data_len] = 0;
        NSString *str = [NSString stringWithCString:outdata encoding:NSUTF8StringEncoding];
    
        return str;
    }
    
}

//data转换为十六进制的string
+ (NSString *)hexStringFromData:(NSData *)myD{
    
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    NSLog(@"hex = %@",hexStr);
    
    return hexStr;
}

+ (NSData *)convertHexStrToData:(NSString *)str
{    if (!str || [str length] == 0) {        return nil;
    }
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:20];    NSRange range;    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }    for (NSInteger i = range.location; i < [str length]; i += 2) {        unsigned int anInt;        NSString *hexCharStr = [str substringWithRange:range];        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }    return hexData;
}

@end

