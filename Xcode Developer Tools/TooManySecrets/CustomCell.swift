import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordValue: UILabel!
    @IBOutlet var imageContainer: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        commonInit()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

//MARK: adding images
extension CustomCell {
    func add(image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            imageView.image = image

        imageContainer.addSubview(imageView)
    }
}

//MARK: - Dynamic Sizing font - iOS 10
extension CustomCell {
    
    func commonInit() {
    }
    
    func setPassword(password: String) {
        passwordValue?.text = password
        passwordValue.accessibilityValue = password
    }
}
