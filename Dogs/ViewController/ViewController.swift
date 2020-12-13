import UIKit

final class ViewController: UIViewController {
    enum Constants {
        static let cellReusableId = DogBreedCollectionViewCell.reuseIdentifier
        static let cellMinWidth: CGFloat = 150.0
        static let cellHeight: CGFloat = 50.0
        static let collectionViewPadding: CGFloat = 8.0
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    let showDetailsSequeName = "showDetails"
    private let viewModel = ViewControllerViewModel()
    var dogBreeds: [DogBreedDto] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadDogBreeds()
    }
    
    override func viewWillLayoutSubviews() {
       super.viewWillLayoutSubviews()
       updateCollectionViewLayout()
    }
    
    private func setupCollectionView() {
        let nib = UINib.init(nibName: String(describing: DogBreedCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func loadDogBreeds(filter: String? = nil) {
       viewModel.fetchDogsBreeds() { [weak self] (dogBreeds, error) in
            self?.dogBreeds = dogBreeds
            self?.collectionView.reloadData()
       }
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
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogBreeds.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogBreedCollectionViewCell.reuseIdentifier, for: indexPath) as? DogBreedCollectionViewCell else {
            assertionFailure("Wrong cell type")
            return UICollectionViewCell()
        }
        cell.set(viewModel: DogBreedCollectionViewCellViewModel(dogBreedDto: dogBreeds[indexPath.row]))
        return cell
    }
   
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: showDetailsSequeName, sender: nil)
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == showDetailsSequeName) {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.dogBreed = dogBreeds[selectedIndex]
            }
        }
    }
}
