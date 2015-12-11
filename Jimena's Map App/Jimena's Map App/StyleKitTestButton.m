

#import "StyleKitTestButton.h"
#import "StyleKitTrial.h"

@implementation StyleKitTestButton

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    [StyleKitTrial drawWhereAreYouButton];
}


@end
