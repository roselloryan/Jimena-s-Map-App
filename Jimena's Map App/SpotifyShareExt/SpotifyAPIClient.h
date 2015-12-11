
#import <Foundation/Foundation.h>

@interface SpotifyAPIClient : NSObject

+(void)getAlbumCoverUrl:(NSString *)trackID withCompletionBlock:(void (^)(NSString *albumCoverLink))completionBlock;

@end
