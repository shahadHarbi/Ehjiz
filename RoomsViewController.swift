
import UIKit
import Firebase
class RoomsViewController: UIViewController {
    var roomName :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignbackground()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
       // self.tabBarController?.tabBar.backgroundColor
//        self.tabBarController?.UIView.tabBar.appearance().shadowImage = UIImage()
//        self.tabBarController?.UIView.tabBar.appearance().backgroundImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        self.tabBarController?.tabBar.shadowImage = UIImage()
        
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    @IBAction func meetingButton(_ sender: Any) {
        roomName = "حجز قاعة اجتماعات"
   performSegue(withIdentifier: "showRoom", sender: nil)
    }
    
    @IBAction func recodingButton(_ sender: Any) {
     roomName = "حجز غرفة التسجيل"
        performSegue(withIdentifier: "showRoom", sender: nil)
   
    }
    
  
    
    @IBAction func classroomButton(_ sender: Any) {
         roomName =   "حجز فصل "
         performSegue(withIdentifier: "showRoom", sender: nil)
    }
    
    @IBAction func brainstormingButton(_ sender: Any) {
         roomName = "حجز غرفة العصف الذهني"
         performSegue(withIdentifier: "showRoom", sender: nil)
        
    }
    @IBAction func signOutButton(_ sender: Any) {
    
       
    do {
        
      try Auth.auth().signOut()
        //dismiss(animated: true, completion: nil)
        let logInVC = storyboard?.instantiateViewController(withIdentifier: "logInVC") as? SignInViewController
        
        
        self.view.window?.rootViewController = logInVC
        self.view.window?.makeKeyAndVisible()
        
        
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRoom" {
            if let nextVC = segue.destination as? MeetingReoomViewController {
                MeetingReoomViewController.pageTitle = roomName
                
            }
        }
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


extension UITabBar {

static func setTransparentTabbar() {
  
  UITabBar.appearance().backgroundImage = UIImage()
  UITabBar.appearance().shadowImage     = UIImage()
  UITabBar.appearance().clipsToBounds   = true
 }
}



