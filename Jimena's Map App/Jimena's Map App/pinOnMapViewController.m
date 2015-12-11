
#import "pinOnMapViewController.h"


@interface pinOnMapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *pinOnMapMapView;

@end


@implementation pinOnMapViewController

//set pinOnMapMapView View Controller as map view delegate

-(void)setPinOnMapMapView:(MKMapView *)pinOnMapMapView {
    _pinOnMapMapView =pinOnMapMapView;
    self.pinOnMapMapView.delegate = self;
    [self.pinOnMapMapView addAnnotation: self.currentLocation];

    NSLog(@"In setter");
    NSLog(@"mapView annotations: latitude: %f longitude: %f", self.pinOnMapMapView.annotations[0].coordinate.latitude, self.pinOnMapMapView.annotations[0].coordinate.longitude);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [self.pinOnMapMapView addAnnotation: self.currentLocation];
//    NSLog(@"current location %@", self.currentLocation);
    [self.pinOnMapMapView showAnnotations:self.pinOnMapMapView.annotations animated:YES];
    NSLog(@"In viewDidLoad");
}


# pragma mark - MKAnnotationViews

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id<MKAnnotation>)annotation {
   
    MKAnnotationView *aView = [mapView dequeueReusableAnnotationViewWithIdentifier: @"aViewIdentifier"];
    
    if(!aView) {
        aView = [[MKPinAnnotationView alloc] initWithAnnotation: annotation
                                                reuseIdentifier:@"aViewIdentifier"];
        //set callout to YES and build aView's callout accesory views here
    }
    aView.annotation = annotation;
    // maybe load up accesory views here (if not too expensive)?
    //or reset them and wait until mapView:didSelectAnnotationView: to load actual data
    return aView;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//}


@end
