import Foundation
import UIKit

class DogHelper {
    static let path = "https://dog.ceo/api/breeds/list/all"
    
    static func dogs(completion: @escaping([DogDto], Error?) -> Void) {
        guard let url = URL(string: path)
        else {
            print("invalid url ->\(path)<-")
            return
        }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            guard let data = data else {
                print("search no data returned")
                return
            }
            do {
//                let decoder = JSONDecoder()
                let breedsResponse = try JSONDecoder().decode(BreedsListResponse.self, from: data)
                let breeds = breedsResponse.message.keys.map({$0})
                var bdto = [DogDto]()
                for b in breeds {
                    bdto.append(DogDto(name:b))
                }
                DispatchQueue.main.async {
                    completion(bdto,error)
                }
            }
            catch let err {
                print("Decoding failed error \(err)")
                fatalError()
            }
        }
        task.resume()
    }
    
//    static func findMovie(id: String, completion: @escaping(MovieJSON.Movie?, Error?) -> Void) {
//        guard let url = URL(string: baseURL+"&i="+id)
//        else {
//            fatalError("Invalid URL")
//        }
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//        let task = session.dataTask(with: url) { data, response, error in
//            guard error == nil else {
//                print ("error: \(error!)")
//                return
//            }
//            guard let data = data else {
//                print("No data")
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let movieDetails = try decoder.decode(MovieJSON.Movie.self, from: data)
//                DispatchQueue.main.async {
//                    completion(movieDetails,error)
//                }
//            }
//            catch let err {
//                print("Decoding failed error \(err)")
//                fatalError()
//            }
//        }
//        task.resume()
//    }
    
//    static func isFavourite(imdbID:String) -> Bool {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return false
//        }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: imdbIDHelper.entityName)
//        fetchRequest.predicate = NSPredicate(format:"imdbID == %@",imdbID)
//        do {
//            let res = try managedContext.fetch(fetchRequest)
//            return res.count > 0
//        }
//        catch let error as NSError {
//            print("Error could not fetch, \(error), \(error.userInfo)")
//        }
//        return false
//    }
//
//    static func fetchFavourites() -> [NSManagedObject]? {
//        var favourities: [NSManagedObject]?
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return favourities
//        }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: imdbIDHelper.entityName)
//        do {
//          favourities = try managedContext.fetch(fetchRequest)
//        } catch let error as NSError {
//          print("Could not fetch. \(error), \(error.userInfo)")
//        }
//        return favourities
//    }
//
//    static func addFavourite(movie:MovieJSON.Movie) -> NSManagedObject? {
//        var movieEntity: NSManagedObject?
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return movieEntity
//        }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: imdbIDHelper.entityName, in: managedContext)!
//        movieEntity = NSManagedObject(entity: entity, insertInto: managedContext)
//        movieEntity?.setValue(movie.imdbID, forKeyPath: "imdbID")
//        movieEntity?.setValue(movie.poster, forKeyPath: "posterURL")
//        movieEntity?.setValue(movie.title, forKeyPath: "title")
//        do {
//            try managedContext.save()
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//        return movieEntity
//    }
//
//    static func removeFavourite(imdbID:String) {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: imdbIDHelper.entityName)
//        fetchRequest.predicate = NSPredicate(format:"imdbID == %@",imdbID)
//        do {
//            let res = try managedContext.fetch(fetchRequest)
//            for object in res {
//                managedContext.delete(object)
//                try managedContext.save()
//            }
//        }
//        catch let error as NSError {
//            print("Error could not delete, \(error), \(error.userInfo)")
//        }
//    }
//
//
//    static func deleteAllFavourites() {
//        guard let appDelegate =
//          UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: imdbIDHelper.entityName)
//        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        do {
//            try managedContext.execute(batchDeleteRequest)
//
//        } catch {
//            print("delete failed")
//        }
//    }
    
}
