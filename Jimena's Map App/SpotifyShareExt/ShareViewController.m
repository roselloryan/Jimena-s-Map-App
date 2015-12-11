//
//  ShareViewController.m
//  SpotifyShareExt
//
//  Created by Jimena Almendares on 12/1/15.
//  Copyright © 2015 RAR. All rights reserved.
//

#import "ShareViewController.h"
#import <Parse/Parse.h>
#import "SpotifyAPIClient.h"

@interface ShareViewController ()

@property(strong, nonatomic) NSString *trackID;
@property(strong, nonatomic) NSString *albumCoverLink;
@property(strong, nonatomic) NSString *titleInfo;

@end

@implementation ShareViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Enable data sharing in app extensions.
    [Parse enableDataSharingWithApplicationGroupIdentifier:@"group.spotify-app-thing"
                                     containingApplication:@"RAR.Jimena-s-Map-App"];
    // Setup Parse
    [Parse setApplicationId:@"Pm6nrVBUZZ1InBxEFaKVIdspU42PkCdr3ptaqmpK" clientKey:@"TXB1BMeMLRN55Evjage5Z33JnsdP9KRCeUccw7hf"];
    
}


- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    self.titleInfo = self.contentText;
    
    for(NSExtensionItem *item in self.extensionContext.inputItems) {
        NSLog(@"%@", item.attributedContentText);
        for(NSItemProvider *attachment in item.attachments) {
            for(NSString *typeID in attachment.registeredTypeIdentifiers) {
                [attachment loadItemForTypeIdentifier:typeID options:nil completionHandler:^(id<NSSecureCoding>  _Nullable item, NSError * _Null_unspecified error) {
                    NSLog(@"\t%@: %@", typeID, item);
                    
                    if([typeID isEqualToString: @"public.url"] == YES)
                    {
                        NSLog(@"public.url Item: %@", item);
                        NSString *itemString = [NSString stringWithFormat:@"%@", item];
                        NSString *trackId = [itemString stringByReplacingOccurrencesOfString:@"https://open.spotify.com/track/" withString:@""];
                        NSLog(@"Track ID: %@", trackId);
                        self.trackID = trackId;
                        
                        [SpotifyAPIClient getAlbumCoverUrl:trackId withCompletionBlock:^(NSString *albumCoverLink) {
                            self.albumCoverLink = albumCoverLink;
                            NSLog(@"ALBUMN COVER LINK: %@", albumCoverLink);
                            
                            PFObject *newSpotifySong = [PFObject objectWithClassName:@"SpotifySong"];
                            newSpotifySong[@"TrackID"] = self.trackID;
                            newSpotifySong[@"TitleInfo"] = self.titleInfo;
                            newSpotifySong[@"AlbumCoverURL"] = self.albumCoverLink;
                            [newSpotifySong saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                                NSLog(@"YAY!!!");
                            }];

                        }];
                    }
                }];
            }
        }
    }
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}

@end
