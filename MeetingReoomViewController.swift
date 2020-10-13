

import UIKit

class MeetingReoomViewController: UIViewController {
    
    @IBOutlet weak var timeCollectionView: UICollectionView!
    
    @IBOutlet weak var roomCollectionView: UICollectionView!
    
    static var isSelectedTime : Bool = false
    static var timeIndex : Int = 0
    static var roomCount : Int = 0
   static var selectedRoom = SelectedRoom()
    
    @IBOutlet weak var reservationRoomName: UILabel!
    static var pageTitle : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        reservationRoomName.font = .boldSystemFont(ofSize: 20)
        reservationRoomName.font = UIFont(name: "DIN Alternate Bold", size: 30)
        roomCollectionView.backgroundColor = .clear
        self.assignbackground()
      timeCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
//        roomCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        reservationRoomName.text = MeetingReoomViewController.pageTitle
        
        
    }
    // willPPEr
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setDate), name: NSNotification.Name(rawValue: "setDate"), object: nil)
    }
    
    @objc func setDate() {
        if CustomDatePickerVC.isStartDate {
            fromDate.titleLabel?.text = CustomDatePickerVC.selectedDate
            MeetingReoomViewController.selectedRoom.date = CustomDatePickerVC.selectedDate
        }
//        else  {
//            toDate.titleLabel?.text = CustomDatePickerVC.selectedDate
//
       // }
        
        CustomDatePickerVC.isStartDate = false
        CustomDatePickerVC.isEndDate = false
        
    }
    
    
    
    
    @IBAction func fromButton(_ sender: Any) {
        showDatePicker()
        fromDate.titleLabel?.text = CustomDatePickerVC.selectedDate
        // fromDate.setTitle("hahaha", for: .normal)
        CustomDatePickerVC.isStartDate = true
        CustomDatePickerVC.isEndDate = false
    }
    @IBOutlet weak var fromDate: UIButton!
   
    
    func showDatePicker() {
        let vc = CustomDatePickerVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async {
            self.present(vc, animated: true)
            
        }
    }
    @IBOutlet weak var buton: UIButton!
    
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

extension MeetingReoomViewController :UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == timeCollectionView) {
            return BookingTime.bookingTimeArray.count
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(findRoomsforSelectedTime), name: NSNotification.Name(rawValue: "timeClicked"), object: nil)
    
        return MeetingReoomViewController.roomCount
        
        
        
    }
    @objc func findRoomsforSelectedTime () {
        print(MeetingReoomViewController.isSelectedTime)
        //        print(MeetingReoomViewController.timeIndex)
        //
        //
        //        print(BookingTime.bookingTimeArray[MeetingReoomViewController.timeIndex].arrayofRooms)
        MeetingReoomViewController.roomCount = BookingTime.bookingTimeArray[MeetingReoomViewController.timeIndex].arrayofRooms.count
        roomCollectionView.reloadData()
     
        print(MeetingReoomViewController.roomCount)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == timeCollectionView {
            //timeCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath) as! TimeCollectionViewCell
            cell.transform = CGAffineTransform(scaleX: -1, y: 1)
            cell.timeLabel.text =
                BookingTime.bookingTimeArray[indexPath.row].time
            
            cell.isUserInteractionEnabled = true
           // cell.backgroundColor = .green
            return cell
            
            
        }
        
        //collectionView.isScrollEnabled = true
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "roomCell", for: indexPath) as! RoomCollectionViewCell
 cell.isHidden = false
        cell.lbl.text = BookingTime.bookingTimeArray[MeetingReoomViewController.timeIndex].arrayofRooms[indexPath.row].roomName
        let isAvailbleRoom = BookingTime.bookingTimeArray[MeetingReoomViewController.timeIndex].arrayofRooms[indexPath.row].isAvailble
        
        if isAvailbleRoom == false {
            cell.lbl.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell.backView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//           cell.isHidden = true
      
            cell.isUserInteractionEnabled = false
            
        } else {
            cell.isUserInteractionEnabled = true
            cell.lbl.textColor = .black
            cell.backView.layer.borderColor = #colorLiteral(red: 0.2777451873, green: 0.8061931729, blue: 0.8352137804, alpha: 1)
        }
    
        

        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
        
        if collectionView == timeCollectionView {
            MeetingReoomViewController.isSelectedTime = true
            MeetingReoomViewController.timeIndex = indexPath.row
            let selectedCell = collectionView.cellForItem(at: indexPath)! as! TimeCollectionViewCell
            selectedCell.backView.backgroundColor = #colorLiteral(red: 0.2777451873, green: 0.8061931729, blue: 0.8352137804, alpha: 1)
            
           // print(BookingTime.bookingTimeArray[indexPath.row].time)
            MeetingReoomViewController.selectedRoom.time = BookingTime.bookingTimeArray[indexPath.row].time
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "timeClicked"), object: nil, userInfo: nil)
           
           // selectedCell.backView.backgroundColor = .green
//            return
            
        }
          
        else{
            if (collectionView.cellForItem(at: indexPath) as? RoomCollectionViewCell) != nil {

                MeetingReoomViewController.selectedRoom.roomName = BookingTime.bookingTimeArray[MeetingReoomViewController.timeIndex].arrayofRooms[indexPath.row].roomName
                print(MeetingReoomViewController.selectedRoom)
            }


        }

        print("SHAAHAAD IS DAA BES IOS DEVELOPPPPERRR")
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == timeCollectionView {
         let selectedCell = collectionView.cellForItem(at: indexPath)! as! TimeCollectionViewCell
            selectedCell.backView.backgroundColor = .clear
                    
                    
         //   return
        }
        
        else{
            if let cell = collectionView.cellForItem(at: indexPath) as? RoomCollectionViewCell {
//               cell.backView.backgroundColor = .white
               cell.backView.layer.borderColor = #colorLiteral(red: 0.2777451873, green: 0.8061931729, blue: 0.8352137804, alpha: 1)
               // cell.deSelectingCEll()
            }
            
        }
        
        
    }
   
    
}




