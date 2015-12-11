
#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "pinOnMapViewController.h"

@interface MapViewController () <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation MapViewController

CLLocationManager *locationManager;
CLGeocoder *geocoder;
CLPlacemark *placemark;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];

    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;

}


# pragma mark - Button actions

- (IBAction)currentLocationButtonTapped:(UIButton *)sender {
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    
    [locationManager startUpdatingLocation];
    NSLog(@"Button Tapped");
}

- (IBAction)crazyButtonTapped:(UIButton *)sender {
    if (self.view.backgroundColor == [UIColor whiteColor]) {
        self.view.backgroundColor = [UIColor lightTextColor];
    }
    else if(self.view.backgroundColor == [UIColor lightTextColor]) {
        self.view.backgroundColor = [UIColor blueColor];
    }
    else {
       self.view.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - CLLocationManagerDelegate Methods

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    NSLog(@"%@", locations);
    NSLog(@"Last CLLocation object in array: %@", [locations lastObject]);
    CLLocation *currentLocation =[locations lastObject];
    
    if(locations != nil) {
        self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        self.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
    }
    
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if(error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            
            self.addressLabel.text = [NSString stringWithFormat: @"%@ %@\n%@ %@\n%@\n%@", placemark.subThoroughfare, placemark.thoroughfare, placemark.postalCode, placemark.locality, placemark.administrativeArea, placemark.country];
            [locationManager stopUpdatingLocation];
        }
        else {
            NSLog(@"Error: %@", error.debugDescription);
        }
        
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    pinOnMapViewController *destinationVC = [[pinOnMapViewController alloc] init];
    destinationVC = segue.destinationViewController;
    
    UserCurrentLocation *currentLocation = [[UserCurrentLocation alloc] initWithLatitude: [self.latitudeLabel.text floatValue] longitude:[self.longitudeLabel.text floatValue]];
    
    // set user current location coordinate from text fields
    destinationVC.currentLocation = currentLocation;
    NSLog(@"In prepareForSegue current location: %@", destinationVC.currentLocation);
    NSLog(@"latitude: %f", [self.latitudeLabel.text floatValue]);
    NSLog(@"longitude: %f", [self.longitudeLabel.text floatValue]);
}




@end




