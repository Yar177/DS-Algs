import UIKit
import PlaygroundSupport

protocol ColorChooserDelegate{
    func selectedColor(color:Int)
}

class Colors{
    var colorIndex = 0
    let colorName = ["red", "green", "blue" , "purple"]
    private var color = [UIColor.red, UIColor.green, UIColor.blue, UIColor.purple ]
    
    func name(_ index:Int) -> String{
        return colorName[index % colorName.count]
    }
    
    func color(_ index: Int) -> UIColor{
        return color[index % color.count]
    }
}

class ColorChooserVC: UIViewController{
    
    var colors = Colors()
    var currentColor = 0
    var delegate:ColorChooserDelegate! = nil
    
    @IBAction func chooser(sender: UISegmentedControl){
        currentColor = sender.selectedSegmentIndex
        view.backgroundColor = colors.color(currentColor)
        delegate.selectedColor(color: currentColor)
        dismiss(animated: true, completion: nil)
        
        NotificationCenter.default.post(name: Notification.Name("text_notification"), object: String(colors.colorName[currentColor]))
    }
    override func viewDidLoad(){
        let chooser = UISegmentedControl(items: colors.colorName)
        chooser.frame = CGRect(x: 100, y: 0, width: 300, height: 100)
        chooser.addTarget(self, action: #selector(chooser(sender:)), for: .valueChanged)
        chooser.tintColor = UIColor.black
        view.addSubview(chooser)
        view.backgroundColor = colors.color(currentColor)
    }
}



class ViewController: UIViewController, ColorChooserDelegate{
    
    func  selectedColor(color: Int) {
        count = color
        view.backgroundColor = colors.color(color)
    }
    var count = 0
    var colors = Colors()
    let button = UIButton(frame: CGRect(x:150, y:0, width: 200, height: 400))
    @IBAction func changeColor(sender: UIButton){
//        count += 1
//        view.backgroundColor = colors.color(count % colors.colorName.count)
        let vc = ColorChooserVC()
        vc.currentColor = count
        vc.delegate = self
        present(vc, animated: true)
    }
   

    override func viewDidLoad(){
        view.backgroundColor = UIColor.orange

        button.setTitle("Color Choice", for: .normal)
        button.backgroundColor = UIColor.darkGray
        button.addTarget(self, action: #selector(changeColor(sender:)), for: .touchUpInside)
        view.addSubview(button)
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived(_:)), name: Notification.Name("text_notification"), object: nil)
    }
    
    @objc func notificationReceived(_ notification: Notification){
        let text = notification.object as! String?
        print(text ?? "no message received")
    }
    
    
}

let colors = Colors()
let myColor = colors.color(1)


//let view = UIView(frame: CGRect(x:0, y:0, width: 400, height: 600))
PlaygroundPage.current.liveView = ViewController()






//MARK: Notifications

/*
 //Sender
 NotificationCenter.default.post(name: Notification.Name("text_notification"), object: String(currentColor))
 
 //Receiver
 in viewDidLoad
NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived(_:)), name: Notification.Name("text_notification"), object: nil)
 
@objc func notificationReceived(_ notification: Notification){
    let text = notification.object as! String?
    //use text
    print(text)
}
 */

//MARK: Protocol
/*
 protocol ColorChooserDelegate{
     func selectedColor(color:Int)
 }
 
 //sender
 var delegate:ColorChooserDelegate! = nil
 delegate.selectedColor(color: currentColor)

 //receiver
 ViewController: UIViewController, ColorChooserDelegate{
 func  selectedColor(color: Int) {
     count = color
     view.backgroundColor = colors.color(color)
 }
 vc.delegate = self
 
 
 */






























































