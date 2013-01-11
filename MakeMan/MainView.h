//
//  MainView.h
//  MakeMan
//
//  Created by Sergey Sergeivich on 10.01.13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIViewController      <UIGestureRecognizerDelegate>{
    UIButton *firstButton_;
}

@property(nonatomic,retain) IBOutlet UIButton* firstButton; 

@end
