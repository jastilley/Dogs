import Foundation
import UIKit

class DogHelper {
    static let root = "https://dog.ceo/api/"
    static let dogBreedsPath = root + "breeds/list/all"
    static let dogRootPath = root + "breed/"
    
    static func dog(dogBreed: String, completion: @escaping(DogDto, Error?) -> Void) {
        let path = dogRootPath + dogBreed + "/images/random"
        guard let url = URL(string: path)
        else {
            print("invalid url \(path)")
            return
        }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print ("error getting data")
                return
            }
            guard let data = data else {
                print("search no data returned")
                return
            }
            do {
                let breedsResponse = try JSONDecoder().decode(DogResponse.self, from: data)
                let path = breedsResponse.message
                guard let url = URL(string:path) else {
                    print("invalid url for path \(path)")
                    return
                }
                let dogDTO = DogDto(imageURL: url)
                DispatchQueue.main.async {
                    completion(dogDTO,error)
                }
            }
            catch let err {
                fatalError("Decoding failed error \(err)")
            }
        }
        task.resume()
    }
    
    static func dogBreeds(completion: @escaping([DogBreedDto], Error?) -> Void) {
        guard let url = URL(string: dogBreedsPath)
        else {
            print("invalid url \(dogBreedsPath)")
            return
        }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print ("error getting data")
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
                fatalError("Decoding failed error \(err)")
            }
        }
        task.resume()
    }
}
