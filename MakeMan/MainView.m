//
//  MainView.m
//  MakeMan
//
//  Created by Sergey Sergeivich on 10.01.13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"

@implementation MainView

@synthesize firstButton=firstButton_;

-(void)dealloc  {
    [firstButton_ release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panPiece:)];
    [pan setDelegate:self];
    self.firstButton.userInteractionEnabled = YES;
    [self.firstButton addGestureRecognizer:pan];
    
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotatePiece:)];
    [rotation setDelegate:self];
    [self.firstButton addGestureRecognizer:rotation];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scalePiece:)];
    [pinch setDelegate:self];
    [self.firstButton addGestureRecognizer:pinch];
    
    [pinch release];
    [rotation release];
//    [pan release];

}

-(void)panPiece:(UIPanGestureRecognizer*)recognizer {
    UIView* view = [recognizer view];
    CGPoint translation = [recognizer translationInView:[view superview]];
    [view setCenter:CGPointMake([view center].x + translation.x, [view center].y + translation.y)];
    [recognizer setTranslation:CGPointZero inView:view];
}

-(void)rotatePiece:(UIRotationGestureRecognizer*)recognizer  {
    [recognizer view].transform = CGAffineTransformRotate([[recognizer view] transform], [recognizer rotation]);
    [recognizer setRotation:0];
}

-(void)scalePiece:(UIPinchGestureRecognizer*)recognizer  {
    [recognizer view].transform = CGAffineTransformScale([[recognizer view] transform], [recognizer scale], [recognizer scale]);
    [recognizer setScale:1];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
