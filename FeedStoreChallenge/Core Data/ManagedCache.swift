//
//  ManagedCache.swift
//  FeedStoreChallenge
//
//  Created by Shreya Pallan on 28/05/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

final class ManagedCache: NSManagedObject {
    @NSManaged var timestamp: Date
    @NSManaged var feed: NSOrderedSet
}

extension ManagedCache {
    var localFeed: [LocalFeedImage] {
       return feed.compactMap { ($0 as? ManagedFeedImage)?.local }
    }
    
   static func find(in context: NSManagedObjectContext) throws -> ManagedCache? {
        let request = NSFetchRequest<ManagedCache>(entityName: entity().name!)
        request.returnsObjectsAsFaults = false
        return try context.fetch(request).first
    }
    
    static func newUniqueInstance(in context: NSManagedObjectContext) throws -> ManagedCache {
        try find(in: context).map(context.delete)
        return ManagedCache(context: context)
    }
}
