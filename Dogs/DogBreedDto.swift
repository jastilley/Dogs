import Foundation

public struct DogBreedDto: Decodable, Equatable {
   public let name: String

    public init(name: String) {
      self.name = name
   }
}

public struct DogDetailsDto: Decodable {
    
}

//public struct IngredientDto: Decodable, Equatable {
//   public let quantity: String
//   public let name: String
//   public let type: String
//
//   public init(quantity: String, name: String, type: String) {
//      self.quantity = quantity
//      self.name = name
//      self.type = type
//   }
//}
