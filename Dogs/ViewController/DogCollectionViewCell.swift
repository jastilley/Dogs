//  Created by work on 26/07/2020.
//  Copyright © 2020 Olatunbosun. All rights reserved.

import UIKit

class DogCollectionViewCell: UICollectionViewCell {
//   static let reuseIdentifier = String(describing: self)
    static let reuseIdentifier = "Cell"
//   @IBOutlet private weak var imageView: DogImageView!
//   @IBOutlet private weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelTitle: UILabel!
    //   @IBOutlet private weak var labelIngredientsCount: UILabel!
//   @IBOutlet private weak var labelMinutes: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
      style()
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
//      imageView.image = nil
   }
   
   func set(viewModel: DogCollectionViewCellViewModel) {
//      imageView.setRecipeImage(with: viewModel.imageUrl)
      labelTitle.text = viewModel.title
//      labelIngredientsCount.text = viewModel.ingredientCount
//      labelMinutes.text = viewModel.minutes
   }
   
   private func style() {
      layer.cornerRadius = 6
      layer.borderWidth = 1
      layer.borderColor = UIColor.lightGray.cgColor
   }
   
}
