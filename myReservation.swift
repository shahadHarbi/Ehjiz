

import UIKit

class myReservation: UIViewController {

    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        self.assignbackground()
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
          dateLabel.text = MeetingReoomViewController.selectedRoom.date
              timeLabel.text = MeetingReoomViewController.selectedRoom.time
              roomNameLabel.text = MeetingReoomViewController.selectedRoom.roomName
              
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
