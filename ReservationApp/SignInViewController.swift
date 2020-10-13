

import UIKit
import Firebase
class SignInViewController: UIViewController {
    
    @IBOutlet weak var UISegment: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
         DispatchQueue.main.async {
                   if Auth.auth().currentUser?.uid != nil {
                  self.moveToTabBar()
                   }
               }
    }
    func register(){
        if let email = emailTextField.text,
            let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                    
                }else {
                 self.moveToTabBar()
//                    self.performSegue(withIdentifier: "hallView", sender: nil)
                }
            }
        }}
    func login(){
        if let email = emailTextField.text,
            let password = passwordTextField.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                    
                }else{
               self.moveToTabBar()
//                    self.performSegue(withIdentifier: "hallView", sender: nil)
                }
            }
        }
    }
    @IBAction func buttonAction(_ sender: Any) {
        // register()
        switch UISegment.selectedSegmentIndex {
        case 0:
            register()
        case 1:
              login()
        default:
            print("Nothing has been selected!")
        }
    }
    
    func moveToTabBar(){
        let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "VCTabBar") as? UITabBarController


           self.view.window?.rootViewController = tabBarVC
           self.view.window?.makeKeyAndVisible()
    }
    
}



