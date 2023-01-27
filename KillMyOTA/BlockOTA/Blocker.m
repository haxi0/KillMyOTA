//
//  Blocker.m
//  KillMyOTA
//
//  Created by Анохин Юрий on 27.01.2023.
//

#define PROFILE1 "/var/mobile/Library/Preferences/com.apple.MobileAsset.plist"
#import <Foundation/Foundation.h>

void enableOTA(void) {
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:@PROFILE1]) {
        [manager removeItemAtPath:@PROFILE1 error:nil];
        
        NSLog(@"Removed");
    }
}

void disableOTA(void) {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:@PROFILE1];
    NSMutableDictionary *mutableDict = dict ? [dict mutableCopy] : [NSMutableDictionary dictionary];
    
    [mutableDict setObject:@"https://mesu.apple.com/assets/tvOS16DeveloperSeed" forKey:@"MobileAssetServerURL-com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain"];
    [mutableDict setObject:@NO forKey:@"MobileAssetSUAllowOSVersionChange"];
    [mutableDict setObject:@NO forKey:@"MobileAssetSUAllowSameVersionFullReplacement"];
    [mutableDict setObject:@"https://mesu.apple.com/assets/tvOS16DeveloperSeed" forKey:@"MobileAssetServerURL-com.apple.MobileAsset.RecoveryOSUpdate"];
    [mutableDict setObject:@"https://mesu.apple.com/assets/tvOS16DeveloperSeed" forKey:@"MobileAssetServerURL-com.apple.MobileAsset.RecoveryOSUpdateBrain"];
    [mutableDict setObject:@"https://mesu.apple.com/assets/tvOS16DeveloperSeed" forKey:@"MobileAssetServerURL-com.apple.MobileAsset.SoftwareUpdate"];
    [mutableDict setObject:@"65254ac3-f331-4c19-8559-cbe22f5bc1a6" forKey:@"MobileAssetAssetAudience"];
    
    [mutableDict writeToFile:@PROFILE1 atomically:YES];
    
    NSLog(@"Installed");
}
