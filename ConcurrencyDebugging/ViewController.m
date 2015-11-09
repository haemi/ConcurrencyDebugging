//
//  ViewController.m
//  ConcurrencyDebugging
//
//  Created by Stefan Walkner on 08.11.15.
//  Copyright © 2015 arkulpa GmbH. All rights reserved.
//

#import "ViewController.h"
#import "MyEntity.h"
#import <GDCoreDataConcurrencyDebugging/GDCoreDataConcurrencyDebugging.h>
#import <MagicalRecord/MagicalRecord.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GDCoreDataConcurrencyDebuggingBeginTrackingAutorelease();
    
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        MyEntity *myEntity = [MyEntity MR_createEntityInContext:localContext];
        myEntity.name = @"test";
    }];
    
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        @autoreleasepool {
            [MyEntity MR_truncateAllInContext:localContext];
        }
    }];
    
    GDCoreDataConcurrencyDebuggingEndTrackingAutorelease();
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
