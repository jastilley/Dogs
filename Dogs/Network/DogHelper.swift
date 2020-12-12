import Foundation
import UIKit

class DogHelper {
    static let path = "https://dog.ceo/api/breeds/list/all"
    
    static func dogs(completion: @escaping([DogBreedDto], Error?) -> Void) {
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
