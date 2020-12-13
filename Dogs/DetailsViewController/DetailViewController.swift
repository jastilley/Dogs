import UIKit

final class DetailViewController: UIViewController {
    
    enum Constants {
//        static let cellReusableId = DetailCollectionViewCell.reuseIdentifier
        static let cellReusableId = DetailCollectionViewCell.reuseIdentifier
        static let cellMinWidth: CGFloat = 150.0
        static let cellHeight: CGFloat = 150
        static let collectionViewPadding: CGFloat = 8.0
    }
    var dogBreed: DogBreedDto? {
        didSet {viewModel.dogBreed = dogBreed}
    }
    @IBOutlet var collectionView: UICollectionView!
    private var dogs: [DogDto] = []
    private let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateCollectionViewLayout()
    }
    
    private func setupCollectionView() {
        let nib = UINib.init(nibName: String(describing: DetailCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func updateCollectionViewLayout() {
        let padding: CGFloat = Constants.collectionViewPadding
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.minimumInteritemSpacing = padding
        flowLayout.minimumLineSpacing = padding
        flowLayout.itemSize = cellSize(padding: padding)
        collectionView.collectionViewLayout = flowLayout
    }
    
    private func cellSize(padding: CGFloat) -> CGSize {
       let viewWidth = view.safeAreaLayoutGuide.layoutFrame.size.width
       let minimumWidth: CGFloat = viewWidth > Constants.cellMinWidth ? Constants.cellMinWidth : viewWidth
       let collectionViewWidth = viewWidth - (padding * 2)
       var width: CGFloat = 0
       
       var cellsPerRow: CGFloat = 1
       repeat {
          let totalPadding = padding * (cellsPerRow - 1)
          let individualPadding = totalPadding / cellsPerRow
          let newWidth = collectionViewWidth / cellsPerRow - individualPadding
          if newWidth < minimumWidth {
             width = cellsPerRow == 1 ? newWidth : width
             break
          }
          width = newWidth
          cellsPerRow += 1
       } while minimumWidth < width
       
       return CGSize(width: width, height: Constants.cellHeight) //Todo: Use dynamic height dynamic
    }
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 10
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellReusableId, for: indexPath) as? DetailCollectionViewCell
        else {
            assertionFailure("Wrong cell type")
            return UICollectionViewCell()
        }
        cell.set(viewModel: DetailCollectionViewCellModel(dog: dogBreed!.name))
        return cell
   }
}
