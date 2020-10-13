

import UIKit

class SummaryReservation: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignbackground()
        roomNameLabel.text = MeetingReoomViewController.selectedRoom.roomName
        
    }
    

    @IBOutlet weak var roomNameLabel: UILabel!
    
    
    
    @IBAction func bookAction(_ sender: Any) {
        createAlert (title: " تم الحجز بنجاح ! ", message: "  لمزيد من التفاصيل الرجاء الذهاب الى حجوزاتي ")
    }
    func createAlert (title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "تم", style: UIAlertAction.Style.default, handler: {
            (action) in
            
            alert.dismiss(animated: true, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)
            
        } ) )
        self.present(alert, animated: true, completion: nil)
    }
    
    func assignbackground(){
        let background = #imageLiteral(resourceName: "MYVC")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
    }
    
}
