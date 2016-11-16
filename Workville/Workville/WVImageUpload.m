//
//  WVImageUpload.m
//  Workville
//
//  Created by Andre Creighton on 11/14/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import "WVImageUpload.h"

@interface WVImageUpload ()

@property (strong, nonatomic) FIRStorage *storage;
@property (strong, nonatomic) FIRStorageReference *storageRef;

@end


@implementation WVImageUpload


-(instancetype)init{
    
    self = [super init];
    
    if(self){
        
        
            _storage = [FIRStorage storage];
            _storageRef = [_storage referenceForURL:@"gs://workville-2d5f4.appspot.com"];
        
    }

    
    return self;
    
}

-(void)uploadDataWithImageData:(NSData *)data ofUser:(NSString *)user{
    
    NSLog(@"And here");
    
    

    // Create a reference to the file you want to upload
    FIRStorageReference *imagesRef = [self.storageRef child:[NSString stringWithFormat:@"%@.jpg",user]];
    
//     Upload the file to the path "images/rivers.jpg"
    FIRStorageUploadTask *uploadTask = [imagesRef putData:data metadata:nil completion:^(FIRStorageMetadata *metadata, NSError *error) {
        if (error != nil) {
            
            NSLog(@"Theres an error");
            
        } else {
            // Metadata contains file metadata such as size, content-type, and download URL.
            NSURL *downloadURL = metadata.downloadURL;
            
        }
    }];
    
    

}


@end
