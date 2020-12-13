import UIKit

class DetailCollectionViewCellModel {
       let dogBreed: String
    var dog: DogDto?
       
       init(dog: String) {
          dogBreed = dog
       }
    
    public func fetchDog(completion: @escaping (DogDto, Error?) -> Void) {
        DogHelper.dog(dogBreed:dogBreed) { [self] (dog, error) in
            self.dog = dog
          completion(self.dog!, error)
       }
    }
}
