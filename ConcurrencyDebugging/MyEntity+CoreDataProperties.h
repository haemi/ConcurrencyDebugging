//
//  MyEntity+CoreDataProperties.h
//  ConcurrencyDebugging
//
//  Created by Stefan Walkner on 08.11.15.
//  Copyright © 2015 arkulpa GmbH. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MyEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
