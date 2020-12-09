//  Created by work on 26/07/2020.
//  Copyright © 2020 Olatunbosun. All rights reserved.

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
   static let reuseIdentifier = String(describing: self)
   
   @IBOutlet private weak var imageView: RecipeImageView!
   @IBOutlet private weak var labelTitle: UILabel!
   @IBOutlet private weak var labelIngredientsCount: UILabel!
   @IBOutlet private weak var labelMinutes: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
      style()
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
      imageView.image = nil
   }
   
   func set(viewModel: RecipeCollectionViewCellViewModel) {
      imageView.setRecipeImage(with: viewModel.imageUrl)
      labelTitle.text = viewModel.title
      labelIngredientsCount.text = viewModel.ingredientCount
      labelMinutes.text = viewModel.minutes
   }
   
   private func style() {
      layer.cornerRadius = 6
      layer.borderWidth = 1
      layer.borderColor = UIColor.lightGray.cgColor
   }
   
}
