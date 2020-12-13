import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "Cell"
    @IBOutlet weak var imageView: DogImageView!
    var viewModel: DetailCollectionViewCellModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        style()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func set(viewModel: DetailCollectionViewCellModel) {
        self.viewModel = viewModel
        viewModel.fetchDog() { [weak self] (dog, error) in
            self?.imageView.load(url: dog.imageURL)
        }
    }
    
    private func style() {
        layer.cornerRadius = 6
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
