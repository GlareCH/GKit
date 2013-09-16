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

//Basic Item
@interface GSelectionBasicItem : NSObject
@property (nonatomic, copy) id type;
@property (nonatomic, copy) id value;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * detail;
@end

#import "GTableViewController.h"

@interface GSelectionViewController : GTableViewController

// data source
@property (nonatomic, strong) NSArray * itemsForSelection;

// scroll
@property (nonatomic, strong) id scrollItem;
@property (nonatomic, assign) UITableViewScrollPosition scrollPosition;

// callback
@property (nonatomic, copy) void (^blockDidSelect)(id selectedItem);

@end
