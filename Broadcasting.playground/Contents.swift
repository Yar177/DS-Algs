import UIKit
import PlaygroundSupport


protocol Observer {
    func notify()
    var uid: Int {get}
}

protocol Subject {
    mutating func register(_ obeserver: Observer)
    mutating func unregister(_ obeserver: Observer)
    
}

extension UILabel: Observer{
    func notify() {
        self.text = "Subject state changed"
    }
    
    var uid: Int {
        return ObjectIdentifier(self).hashValue
    }
}


extension UIButton: Subject{
    private static var observers = [Observer]()
    
    func register(_ obeserver: Observer) {
        UIButton.observers.append(obeserver)
    }
    
    func unregister(_ obeserver: Observer) {
        UIButton.observers = UIButton.observers.filter{$0.uid != obeserver.uid}
    }
    
    func onStateChanged(){
        UIButton.observers.forEach { (observer) in
            observer.notify()
        }
    }
    
}

class MyViewController : UIViewController {
    var labels = [UILabel]()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let notifyButton = UIButton(frame: CGRect(x: 0, y: 50, width: 380, height: 44))
        notifyButton.setTitle("Notify observers", for: .normal)
        notifyButton.setTitleColor(.black, for: .normal)
        notifyButton.backgroundColor = .lightGray
        view.addSubview(notifyButton)

        let unregisterButton = UIButton(frame: CGRect(x: 0, y: 100, width: 380, height: 44))
        unregisterButton.setTitle("Unregister observer", for: .normal)
        unregisterButton.setTitleColor(.white, for: .normal)
        unregisterButton.backgroundColor = .red
        view.addSubview(unregisterButton)

        let labelCount = 10
        
        for i in 0 ..< labelCount {
            let label = UILabel(frame: CGRect(x: 0, y: 200 + (i * 30), width: 380, height: 20))
            label.text = "Label # \(i + 1) listening"
            label.textColor = .black
            label.textAlignment = .center
            view.addSubview(label)
            labels.append(label)
        }
        
        self.view = view
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
