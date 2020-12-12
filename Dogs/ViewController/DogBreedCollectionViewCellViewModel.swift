import Foundation

struct DogBreedCollectionViewCellViewModel {
//   let imageUrl: URL
   let title: String
//   let ingredientCount: String
//   let minutes: String
   
   init(dogBreedDto: DogBreedDto) {
//      imageUrl = dogDto.imageURL
      title = dogBreedDto.name
//      ingredientCount = "\(recipeDto.ingredients.count) ingredients"
//      let totalTime = recipeDto.timers.reduce(0) { $0 + $1 }
//      minutes =  "\(totalTime) minutes"
   }
}
