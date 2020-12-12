import UIKit

class DogBreedCollectionViewCell: UICollectionViewCell {
//   static let reuseIdentifier = String(describing: self)
    static let reuseIdentifier = "Cell"
    
    @IBOutlet weak var labelTitle: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
      style()
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
   }
   
   func set(viewModel: DogBreedCollectionViewCellViewModel) {
      labelTitle.text = viewModel.title
   }
   
   private func style() {
      layer.cornerRadius = 6
      layer.borderWidth = 1
      layer.borderColor = UIColor.lightGray.cgColor
   }
}
