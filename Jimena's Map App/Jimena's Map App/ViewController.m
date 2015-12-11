
#import "ViewController.h"
#import <Parse/Parse.h>


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *albumURLTextField;
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;
@property (weak, nonatomic) IBOutlet UIImageView *albumCoverImageView;

@end


@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];

//    PFObject *testTrack = [PFObject objectWithClassName:@"track"];
//    testTrack[@"albumCoverURL"] = @"http://www.iamlmp.com/wp-content/uploads/2014/10/Zion-Y-Lennox-Pierdo-La-Cabeza.jpg";
//    [testTrack saveInBackground];

  
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

#pragma mark - button actions

- (IBAction)saveButtonTapped:(UIButton *)sender {
    
    PFObject *newTrack = [PFObject objectWithClassName:@"SpotifySong"];
    newTrack[@"TitleInfo"] = self.titleTextField.text;
    newTrack[@"AlbumCoverURL"] = self.albumURLTextField.text;
    [newTrack saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(succeeded ==YES) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Success"
                                                                           message: @"Track Saved"
                                                                    preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style: UIAlertActionStyleDefault handler:nil];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Failed"
                                                                               message: @"Track failed to save"
                                                                        preferredStyle: UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style: UIAlertActionStyleDefault handler:nil];
                [alert addAction:ok];
                [self presentViewController:alert animated:YES completion:nil];
    
            }
        }];
}

- (IBAction)queryButtonTapped:(UIButton *)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"SpotifySong"];
    [query whereKey:@"TitleInfo" equalTo:self.titleTextField.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(!error) {
            // the query succeeded
            for(PFObject *object in objects) {
                NSString *title = object[@"TitleInfo"];
                self.titleTextView.text = title;
                
                NSURL *coverURL = [NSURL URLWithString:object[@"AlbumCoverURL"]];
                NSLog(@"%@", object[@"AlbumCoverURL"]);
                NSData *coverImageData = [NSData dataWithContentsOfURL:coverURL];
                UIImage *coverImage = [UIImage imageWithData:coverImageData];
                self.albumCoverImageView.image = coverImage;
                
            }
        }
        else {
            NSLog(@"%@ %@", error, [error userInfo]);
        }
    }];

}

- (IBAction)deleteButtonTapped:(UIButton *)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"TitleInfo"];
    [query whereKey:@"TitleInfo" equalTo:self.titleTextField.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(!error) {
            // the query succeeded
            for(PFObject *object in objects) {

                [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                    if(succeeded ==YES) {
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Success"
                                                                                       message: @"Track deleted"
                                                                                preferredStyle: UIAlertControllerStyleAlert];
                        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style: UIAlertActionStyleDefault handler:nil];
                        [alert addAction:ok];
                        [self presentViewController:alert animated:YES completion:nil];
                    }
                    else {
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Failed"
                                                                                       message: @"Track failed to delete"
                                                                                preferredStyle: UIAlertControllerStyleAlert];
                        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style: UIAlertActionStyleDefault handler:nil];
                        [alert addAction:ok];
                        [self presentViewController:alert animated:YES completion:nil];
                        
                    }
                }];
                
            }
        }
        else {
            NSLog(@"%@ %@", error, [error userInfo]);
        }
    }];
    
}

@end
