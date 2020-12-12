import UIKit

final class ViewController: UIViewController {
    
    enum Constants {
       static let cellReusableId = DogBreedCollectionViewCell.reuseIdentifier
       static let cellMinWidth: CGFloat = 150.0
       static let cellHeight: CGFloat = 50.0
       static let collectionViewPadding: CGFloat = 8.0
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = ViewControllerViewModel()
    var dogBreeds: [DogBreedDto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        func fetchSearch() {
//            DogHelper.dogs() { (dogBreeds, error) in
//                self.dogBreeds = dogBreeds
//                print("\(dogBreeds)")
//            }
//        }
//        
////        fetchSearch()
        
        setupCollectionView()
        loadRecipes()
    }
    
    override func viewWillLayoutSubviews() {
       super.viewWillLayoutSubviews()
       
       updateCollectionViewLayout()
    }
    
    private func setupCollectionView() {
       let nib = UINib.init(nibName: String(describing: DogBreedCollectionViewCell.self), bundle: nil)
//       collectionView.register(nib, forCellWithReuseIdentifier: Constants.cellReusableId)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
       collectionView.dataSource = self
       collectionView.delegate = self
//       collectionView.keyboardDismissMode = .onDrag
    }
    
    private func loadRecipes(filter: String? = nil) {
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
//    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? DogCollectionViewCell else {
//       assertionFailure("Wrong cell type")
//       return UICollectionViewCell()
//    }
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? DogBreedCollectionViewCell else {
         assertionFailure("Wrong cell type")
         return UICollectionViewCell()
      }
      let recipe = dogBreeds[indexPath.row]
      cell.set(viewModel: DogBreedCollectionViewCellViewModel(dogBreedDto: recipe))
      
      return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView didSelectItemAt")
    //      let detailViewModel = DetailViewModel(dogBreeds: dogBreeds[indexPath.row])
//      let detailViewController = DetailViewController(viewModel: detailViewModel)
//      navigationController?.pushViewController(detailViewController, animated: true)
   }
   
   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//      loadRecipes(filter: searchBar.text)
   }
}
