//
// Created by Cao Hua <glare.ch@gmail.com> on 2012
// Copyright 2012 GKit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "NSMutableArray+GKit.h"

@implementation NSMutableArray (GKit)

- (void)insertObjectAtCenter:(id)anObject
{
    [self insertObject:anObject atIndex:self.count/2];
}

- (void)removeObjectAtPosition:(NSInteger)position {
	NSInteger index;
	if (position<0) {
		index = self.count + position;
	}else {
		index = position;
	}
	
	if (index>=0 && index<[self count]) {
        [self removeObjectAtIndex:index];
	}
}

@end
