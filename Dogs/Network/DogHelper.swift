import Foundation
import UIKit

class DogHelper {
    static let dogBreedsPath = "https://dog.ceo/api/breeds/list/all"
    
    static let dogRootPath = "https://dog.ceo/api/breed"
//    /pug/images/random
    
//    static func dogs(dog:String, completion: @escaping([DogDetailsDto], Error?) -> Void) {
//        let path = dogRootPath + dog + "/images/random"
//        guard let url = URL(string: path)
//        else {
//            print("invalid url ->\(path)<-")
//            return
//        }
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//    }
    
    static func dogs(completion: ([DogDetailsDto], Error?) -> Void) {
        let dog  = "pug"
        let path = dogRootPath + dog + "/images/random"
        guard let url = URL(string: path)
        else {
            print("invalid url ->\(path)<-")
            return
        }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
    }
    
    static func dogs(dogBreed: String, completion: @escaping([DogDetailsDto], Error?) -> Void) {
        let dog  = "pug"
        let path = dogRootPath + dog + "/images/random"
        guard let url = URL(string: path)
        else {
            print("invalid url ->\(path)<-")
            return
        }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
    }
    
    static func dogBreeds(completion: @escaping([DogBreedDto], Error?) -> Void) {
        guard let url = URL(string: dogBreedsPath)
        else {
            print("invalid url ->\(dogBreedsPath)<-")
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
                let breedsResponse = try JSONDecoder().decode(DogBreedsResponse.self, from: data)
                let breeds = breedsResponse.message.keys.map({$0})
                var dogBreedDTO = [DogBreedDto]()
                for breed in breeds {
                    dogBreedDTO.append(DogBreedDto(name:breed))
                }
                DispatchQueue.main.async {
                    completion(dogBreedDTO,error)
                }
            }
            catch let err {
                print("Decoding failed error \(err)")
                fatalError()
            }
        }
        task.resume()
    }
}
