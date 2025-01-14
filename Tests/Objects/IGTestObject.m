/*
 * Copyright (c) Meta Platforms, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "IGTestObject.h"

@implementation IGTestObject

- (instancetype)initWithKey:(id)key value:(id)value {
    if (self = [super init]) {
        _key = [key copy];
        _value = value;
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return [[IGTestObject alloc] initWithKey:self.key value:self.value];
}


#pragma mark - IGListDiffable

- (id<NSObject>)diffIdentifier {
    return self.key;
}

- (BOOL)isEqualToDiffableObject:(id)object {
    if (object == self) {
        return YES;
    }
    if ([object isKindOfClass:[IGTestObject class]]) {
        id k1 = self.key;
        id k2 = [object key];
        id v1 = self.value;
        id v2 = [(IGTestObject *)object value];
        return (v1 == v2 || [v1 isEqual:v2]) && (k1 == k2 || [k1 isEqual:k2]);
    }
    return NO;
}

@end
