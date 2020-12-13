import Foundation

public struct DogBreedDto: Decodable, Equatable {
   public let name: String

    public init(name: String) {
      self.name = name
   }
}

public struct DogDto: Decodable {
    public let imageURL: URL
//    public let path: String
    
    public init(imageURL: URL) {
       self.imageURL = imageURL
    }
}
