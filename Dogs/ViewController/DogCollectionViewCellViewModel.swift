import Foundation

struct DogCollectionViewCellViewModel {
//   let imageUrl: URL
   let title: String
//   let ingredientCount: String
//   let minutes: String
   
   init(dogDto: DogDto) {
//      imageUrl = dogDto.imageURL
      title = dogDto.name
//      ingredientCount = "\(recipeDto.ingredients.count) ingredients"
//      let totalTime = recipeDto.timers.reduce(0) { $0 + $1 }
//      minutes =  "\(totalTime) minutes"
   }
}
