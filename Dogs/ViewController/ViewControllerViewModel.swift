import UIKit

final class ViewControllerViewModel {
    private var dogs: [DogDto] = []
    
    public func fetchDogsBreeds(completion: @escaping ([DogDto], Error?) -> Void) {
        
//        init(recipesRestClient: RecipesRestClientProtocol = RecipesRestClient()) {
//           self.recipesRestClient = recipesRestClient
//        }
//
//        DogHelper.dogs(completion: @escaping([DogDto], Error?) -> Void)
        DogHelper.dogs { [self] (recipes, error) in
        
        
//       recipesRestClient.recipes { [self] (recipes, error) in
          self.dogs = recipes ?? []
          completion(self.dogs, error)
       }
    }
    
}
