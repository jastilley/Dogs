import Foundation

struct DogBreedCollectionViewCellViewModel {
   let title: String
   
   init(dogBreedDto: DogBreedDto) {
      title = dogBreedDto.name
   }
}
