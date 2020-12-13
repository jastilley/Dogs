import UIKit

struct DetailCollectionViewCellModel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    //   let imageUrl: URL
       let title: String
       
       init(dog: String) {
    //      imageUrl = dogDto.imageURL
          title = dog
       }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
