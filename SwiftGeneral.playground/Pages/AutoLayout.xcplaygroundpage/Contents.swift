//: [Previous](@previous)

import Foundation
import UIKit

let button = UIButton()
let image = UIImageView()
let label = UILabel()


let subviews:[UIView] = [button, image, label]
let stackView:UIStackView = UIStackView(arrangedSubviews: subviews)
stackView.axis = .horizontal
stackView.alignment = .fill
stackView.distribution = .fill
stackView.spacing = 10

stackView.translatesAutoresizingMaskIntoConstraints = false
var constraints = [NSLayoutConstraint]()
constraints += [NSLayoutConstraint.init(item: button, attribute: .width, relatedBy: .equal, toItem: image, attribute: .width, multiplier: 1.0, constant: 0.0)]

constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[stackView]-|", options: .alignAllCenterX, metrics: nil, views: ["stackView":stackView]))


stackView.addConstraints(constraints)








































//: [Next](@next)
