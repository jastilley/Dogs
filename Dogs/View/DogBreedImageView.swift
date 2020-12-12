import Foundation
import UIKit

final class DogBreedImageView: UIImageView {
   private let activityIndicatorView = UIActivityIndicatorView.init(style: .gray)
//   private let recipesRestClient = RecipesRestClient()
   
   override var image: UIImage? {
      didSet { style(isLoading: true) }
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      setup()
   }
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
      setup()
   }
   
   func setRecipeImage(with url: URL) {
      activityIndicatorView.startAnimating()
//      recipesRestClient.recipeImage(url: url) { [weak self] (data, error) in
//         if let data = data, let image = UIImage(data: data) {
//            self?.image = image
//            self?.style(isLoading: false)
//         }
//         self?.activityIndicatorView.stopAnimating()
//      }
   }
   
   private func setup() {
      addSubview(activityIndicatorView)
      
      activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         activityIndicatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
         activityIndicatorView.topAnchor.constraint(equalTo: topAnchor),
         activityIndicatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
         activityIndicatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])
      
      style(isLoading: true)
   }
   
   private func style(isLoading: Bool) {
      if isLoading {
         backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
         layer.cornerRadius = 4
         return
      }
      
      backgroundColor = nil
      layer.cornerRadius = 0
   }
}

