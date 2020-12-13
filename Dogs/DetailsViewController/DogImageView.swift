import UIKit

final class DogImageView: UIImageView {
    private let activityIndicatorView = UIActivityIndicatorView.init(style: .gray)
    
    override var image: UIImage? {
        didSet {style(isLoading: true)}
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
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
