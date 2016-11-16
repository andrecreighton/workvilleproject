//
//  WVImageUpload.h
//  Workville
//
//  Created by Andre Creighton on 11/14/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import <Foundation/Foundation.h>
@import FirebaseStorage;

@interface WVImageUpload : NSObject





-(instancetype)init;

-(void)uploadDataWithImageData:(NSData *)data ofUser:(NSString *)user;



@end
