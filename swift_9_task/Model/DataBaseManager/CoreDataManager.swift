//
//  CoreDataManager.swift
//  swift_9_task
//
//  Created by Omar on 22/02/2023.
//

import Foundation
import CoreData
import UIKit
protocol CoreDataService {
    static func saveToDataBase(arr_title:[String] , arr_image:[String])
    static func fetchFromDataBase() ->[MovieItem]
    static func dataBaseIsEmpty()->Bool
}

class CoreDataManager : CoreDataService {
    static func dataBaseIsEmpty() -> Bool {
        
        var context : NSManagedObjectContext?
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
        
        
        var movies : [NSManagedObject]?
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        do
        {
            movies = try context?.fetch(fetchRequest)
            guard let items = movies else {return false}
            if items.count == 0
            {
                return true
            }
        }catch let error{
            print(error)
        }
        
        return false
    }
    
    
    
    static func saveToDataBase(arr_title: [String], arr_image: [String]) {
        var context : NSManagedObjectContext?
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
        
        guard let myContext = context else {return}
        
        
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: myContext)
        
        
        guard let myEntity = entity else{return}
        do
        {
            for (movie_title , movie_image) in zip(arr_title , arr_image)
            {
                let movie = NSManagedObject(entity: myEntity, insertInto: myContext)
                movie.setValue(movie_title, forKey: "title")
                print("successfully saved title")
                movie.setValue(movie_image, forKey: "image")
                print("successfully saved image")
            }
            try myContext.save()
        }catch let error
        {
            print(error)
        }
        print("successfully saved")
    }
    
    static func fetchFromDataBase() ->[MovieItem] {
        
        var movie_item = MovieItem()
        var movie_items :[MovieItem]=[]
        
        var context : NSManagedObjectContext?
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
        //        var movies : [NSManagedObject]?
        guard let myContext = context else {return []}
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        do
        {
            let movies = try myContext.fetch(fetchRequest)
            
            for item in movies
            {
//                arr_title.append(item.value(forKey: "title") as! String)
//                arr_image.append(item.value(forKey: "image") as! String)
                
                movie_item.name = item.value(forKey: "title") as! String
                movie_item.image = item.value(forKey: "image") as! String
                movie_items.append(movie_item)
            }
        }catch let error{
            print(error)
        }
        
        return movie_items
    }
    
    
}
