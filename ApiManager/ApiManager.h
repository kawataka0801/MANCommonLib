//
//  ApiManager.h
//  manacon
//
//  Created by kawakamin on 2013/12/13.
//  Copyright (c) 2013年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@class NXOAuth2Request;

@interface ApiManager : NSObject


enum ApiManagerErrorState{
    ApiManagerErrorStateNetwork = 1,
    ApiManagerErrorStateServer = 2,
    ApiManagerErrorStateURL = 3,
    ApiManagerErrorStateElse = 4,
    ApiManagerErrorStateRefreshToken = 5,
    ApiManagerErrorStateNoData = 6,
};


+(void)authWithEmail:(NSString *)email pass:(NSString *)pass completion:(void(^)(NSError *error))completion;
+(void)getWithURLString:(NSString *)urlString params:(NSDictionary *)params completion:(void(^)(NSDictionary *dict, NSError *error))completion;
+(void)postWithURLString:(NSString *)urlString params:(NSDictionary *)params completion:(void(^)(NSDictionary *dict, NSError *error))completion;
+(void)patchWithURLString:(NSString *)urlString params:(NSDictionary *)params completion:(void(^)(NSDictionary *dict, NSError *error))completion;
+(void)putWithURLString:(NSString *)urlString params:(NSDictionary *)params completion:(void(^)(NSDictionary *dict, NSError *error))completion;
+(void)postImageWithURLString:(NSString *)urlString params:(NSDictionary *)params NSData:(NSData *)data name:(NSString *)name fileName:(NSString *)filename completion:(void(^)(NSDictionary *dict, NSError *error))completion;

@end
