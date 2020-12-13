import Foundation

struct DogBreedsJSON: Codable {
    let message: [String:[String]]
}

struct DogBreedsResponse: Codable {
    let status: String
    let message: [String : [String]]
}

struct DogResponse: Codable {
    let status: String
    let message: String
}

