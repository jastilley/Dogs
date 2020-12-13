import UIKit

final class ViewControllerViewModel {
    private var dogsBreeds: [DogBreedDto] = []
    
    public func fetchDogsBreeds(completion: @escaping ([DogBreedDto], Error?) -> Void) {
        DogHelper.dogBreeds { [weak self] (dogsBreeds, error) in
            self?.dogsBreeds = dogsBreeds
            completion(dogsBreeds, error)
        }
    }
}
