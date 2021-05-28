//
//  ManagedCache.swift
//  FeedStoreChallenge
//
//  Created by Shreya Pallan on 28/05/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

internal class ManagedCache: NSManagedObject {
    @NSManaged var timestamp: Date
    @NSManaged var feed: NSOrderedSet
}
