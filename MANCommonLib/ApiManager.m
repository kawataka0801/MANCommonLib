//
//  ApiManager.m
//  manacon
//
//  Created by kawakamin on 2013/12/13.
//  Copyright (c) 2013年 √ä√±√¢√ã√≥¬ß √Å‚Ä¢√™‚Ä∞¬™√£. All rights reserved.
//

#import "ApiManager.h"
#import <AFOAuth2Client.h>
#import "ApiErrorHandleHelper.h"

@implementation ApiManager

#define ApiHost @"a"
#define kClientId @"b"
#define kSecret @"c"
#define kTokenURL @"d"

+(AFOAuth2Client *)oauthClient
{
    AFOAuth2Client *oauthClient = [AFOAuth2Client clientWithBaseURL:[NSURL URLWithString:ApiHost] clientID:kClientId secret:kSecret];
    [oauthClient setAuthorizationHeaderWithCredential:[AFOAuthCredential retrieveCredentialWithIdentifier:kOauth2StoreIdentifier]];
    return oauthClient;
}



/**
 * get
 */


+(void)getWithURLString:(NSString *)urlString params:(NSDictionary *)params completion:(void(^)(NSDictionary *dict, NSError *error))completion
{
    [self.oauthClient GET:urlString parameters:params
                  success:^(AFHTTPRequestOperation *operation, id responseObject){
                      
                      if (responseObject[@"error"]){
                          return completion(nil, [[NSError alloc]initWithDomain:@"elseError"
                                                                           code:ApiManagerErrorStateElse
                                                                       userInfo:@{NSLocalizedDescriptionKey:responseObject[@"error"]}]);
                      }
                      return completion(responseObject[@"data"],nil);
                      
                  }failure:^(AFHTTPRequestOperation *operation, NSError *error){
                      
                      [self handleWithError:error completion:^(NSError *error){
                          if (!error) return [self getWithURLString:urlString params:params completion:completion]; //再帰
                          return completion(nil, error);
                      }];
                  }
     ];
}




/**
 * post
 */


+(void)postWithURLString:(NSString *)urlString params:(NSDictionary *)params completion:(void(^)(NSDictionary *dict, NSError *error))completion
{
    [self.oauthClient POST:urlString parameters:params
                   success:^(AFHTTPRequestOperation *operation, id responseObject){
                       if (responseObject[@"error"]){
                           return completion(nil, [[NSError alloc]initWithDomain:@"elseError"
                                                                            code:ApiManagerErrorStateElse
                                                                        userInfo:@{NSLocalizedDescriptionKey:responseObject[@"error"]}]);
                       }
                       return completion(responseObject[@"data"],nil);
                       
                   }failure:^(AFHTTPRequestOperation *operation, NSError *error){
                       
                       [self handleWithError:error completion:^(NSError *error)
                       {
                           if (!error){
                               return [self postWithURLString:urlString params:params completion:completion]; //再帰
                           }
                           return completion(nil, error);
                       }];
                   }
     ];
}





/**
 * patch
 */


+(void)patchWithURLString:(NSString *)urlString params:(NSDictionary *)params completion:(void(^)(NSDictionary *dict, NSError *error))completion
{
    [self.oauthClient PATCH:urlString parameters:params
                   success:^(AFHTTPRequestOperation *operation, id responseObject){
                       if (responseObject[@"error"]){
                           return completion(nil, [[NSError alloc]initWithDomain:@"elseError"
                                                                            code:ApiManagerErrorStateElse
                                                                        userInfo:@{NSLocalizedDescriptionKey:responseObject[@"error"]}]);
                       }
                       
                       return completion(responseObject[@"data"],nil);
                       
                   }failure:^(AFHTTPRequestOperation *operation, NSError *error){
                       
                       [self handleWithError:error completion:^(NSError *error){
                           if (!error) return [self patchWithURLString:urlString params:params completion:completion]; //再帰
                           return completion(nil, error);
                       }];

                   }
     ];
}




/**
 * put
 */

+(void)putWithURLString:(NSString *)urlString params:(NSDictionary *)params completion:(void(^)(NSDictionary *dict, NSError *error))completion
{
    [self.oauthClient PUT:urlString parameters:params
                   success:^(AFHTTPRequestOperation *operation, id responseObject){
                       if (responseObject[@"error"]){
                           return completion(nil, [[NSError alloc]initWithDomain:@"elseError"
                                                                            code:ApiManagerErrorStateElse
                                                                        userInfo:@{NSLocalizedDescriptionKey:responseObject[@"error"]}]);
                       }
                       return completion(responseObject[@"data"],nil);
                       
                   }failure:^(AFHTTPRequestOperation *operation, NSError *error){
                       
                       [self handleWithError:error completion:^(NSError *error){
                           if (!error) return [self putWithURLString:urlString params:params completion:completion]; //再帰
                           return completion(nil, error);
                       }];
                       
                   }
     ];
}



/**
 * 画像投稿
 */


+(void)postImageWithURLString:(NSString *)urlString params:(NSDictionary *)params NSData:(NSData *)data name:(NSString *)name fileName:(NSString *)filename
                   completion:(void(^)(NSDictionary *dict, NSError *error))completion
{
    
    [self.oauthClient POST:urlString parameters:params constructingBodyWithBlock:^(id formData){
        
        [formData appendPartWithFileData:data name:name fileName:filename mimeType:@"application/json"];
        
    }success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        if (responseObject[@"error"]){
            return completion(nil, [[NSError alloc]initWithDomain:@"elseError"
                                                             code:ApiManagerErrorStateElse
                                                         userInfo:@{NSLocalizedDescriptionKey:responseObject[@"error"]}]);
        }
        return completion(responseObject[@"data"],nil);
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        
        [self handleWithError:error completion:^(NSError *error){
            
            if (!error) return [self postImageWithURLString:urlString params:params NSData:data name:name fileName:filename completion:completion];
            
            return completion(nil, error);
        }];
        
    }];
}


+(void)handleWithError:(NSError *)error completion:(void(^)(NSError *error))completion{
    
    switch (error.code) {
            
        case -1011:
            //"アクセストークン失効 / URLが違う / 500エラー のいずれか"
            if ([ApiErrorHandleHelper isContainsErrorString:@"401" error:error]){
                return [self refreshAccessTokenByRefreshTokenWithCompletion:completion];
            }
            
            if ([ApiErrorHandleHelper isContainsErrorString:@"500" error:error]){
                return completion([[NSError alloc]initWithDomain:@"serverError"
                                                            code:ApiManagerErrorStateServer
                                                        userInfo:@{NSLocalizedDescriptionKey:SERVER_ERROR_ALERT}]);
            }
            
            return completion([[NSError alloc]initWithDomain:@"urlError"
                                                        code:ApiManagerErrorStateURL
                                                    userInfo:@{NSLocalizedDescriptionKey:SERVER_ERROR_ALERT}]);
            break;
            
        case -1009:
            return completion([[NSError alloc]initWithDomain:@"networkError"
                                                        code:ApiManagerErrorStateNetwork
                                                    userInfo:@{NSLocalizedDescriptionKey:NETWORK_ERROR_ALERT}]);
            break;
            
        case -1001:
            //リクエストタイムアウト
            return completion([[NSError alloc]initWithDomain:@"serverError"
                                                        code:ApiManagerErrorStateServer
                                                    userInfo:@{NSLocalizedDescriptionKey:SERVER_ERROR_ALERT}]);
            break;
            
        case 3840:
            return completion([[NSError alloc]initWithDomain:@"serverError"
                                                        code:ApiManagerErrorStateServer
                                                    userInfo:@{NSLocalizedDescriptionKey:SERVER_ERROR_ALERT}]);
            break;
           
        default:
            return completion([[NSError alloc]initWithDomain:@"elseError"
                                                        code:ApiManagerErrorStateElse
                                                    userInfo:@{NSLocalizedDescriptionKey:@"エラーが発生しました"}]);
            break;
    }
    
}



+(void)refreshAccessTokenByRefreshTokenWithCompletion:(void(^)(NSError *error))completion{
    
    NSString *token = [AFOAuthCredential retrieveCredentialWithIdentifier:kOauth2StoreIdentifier].refreshToken;
    [self.oauthClient authenticateUsingOAuthWithURLString:kTokenURL
                                             refreshToken:token
     
                                                  success:^(AFOAuthCredential *credential){
                                                      
                                                      [AFOAuthCredential storeCredential:credential withIdentifier:kOauth2StoreIdentifier];
                                                      [self.oauthClient setAuthorizationHeaderWithCredential:credential];
                                                      completion(nil);
                                                      
                                                  }failure:^(NSError *error){
                                                      
                                                      completion([[NSError alloc]initWithDomain:@"refreshTokenError"
                                                                                           code:ApiManagerErrorStateRefreshToken
                                                                                       userInfo:@{@"errorString":kRefreshAccessTokenError}]);
                                                  }];
}




/**
 * mail, pass
 */

+(void)authWithEmail:(NSString *)email pass:(NSString *)pass completion:(void(^)(NSError *error))completion{
    
    AFOAuth2Client *oauthClient = [AFOAuth2Client clientWithBaseURL:[NSURL URLWithString:ApiHost] clientID:kClientId secret:kSecret];
    
    [oauthClient authenticateUsingOAuthWithURLString:kTokenURL username:email password:pass scope:nil
     
                                             success:^(AFOAuthCredential *credential){
                                                 
                                                 [AFOAuthCredential storeCredential:credential withIdentifier:kOauth2StoreIdentifier];
                                                 [oauthClient setAuthorizationHeaderWithCredential:credential];
                                                 completion(nil);
                                                 
                                             }failure:^(NSError *error){
                                                 
                                                 [self handleWithError:error completion:completion];
                                                 
                                             }
     ];
}

@end
