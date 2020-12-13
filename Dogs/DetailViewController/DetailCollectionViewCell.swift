import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
//   static let reuseIdentifier = String(describing: self)
    static let reuseIdentifier = "Cell"
    @IBOutlet weak var imageView: DogImageView!
    @IBOutlet weak var labelTitle: UILabel!
    var viewModel: DetailCollectionViewCellModel?

    
    override func awakeFromNib() {
       super.awakeFromNib()
       style()
    }
    
    override func prepareForReuse() {
       super.prepareForReuse()
//       imageView.image = nil
    }
    
    func set(viewModel: DetailCollectionViewCellModel) {
        print("DetailCollectionViewCell viewModel set")
        self.viewModel = viewModel
        
        viewModel.fetchDog() { [weak self] (dog, error) in
            print("DetailCollectionViewCell dog is \(dog)")
            self!.imageView.load(url: dog.imageURL)
//           self?.dogBreeds = dogBreeds
//           self?.collectionView.reloadData()
        }
        
//        labelView.text = "dd"
        imageView.setDogImage(with: viewModel.dogBreed)
//       imageView.setRecipeImage(with: viewModel.imageUrl)
    }
    
    private func style() {
       layer.cornerRadius = 6
       layer.borderWidth = 1
       layer.borderColor = UIColor.lightGray.cgColor
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
