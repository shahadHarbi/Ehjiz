

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lbl: UILabel!
    
    lazy var backView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 6
        $0.backgroundColor = .clear
        $0.layer.borderColor = #colorLiteral(red: 0.2759390473, green: 0.7982398868, blue: 0.827318728, alpha: 1)
        $0.layer.borderWidth = 1.5
        return $0
    }(UIView())
    
    
     lazy var selectBackView : UIView = {
         $0.translatesAutoresizingMaskIntoConstraints = false
         $0.layer.cornerRadius = 6
         $0.backgroundColor = #colorLiteral(red: 0.2759390473, green: 0.7982398868, blue: 0.827318728, alpha: 1)
         $0.layer.borderColor = #colorLiteral(red: 0.2759390473, green: 0.7982398868, blue: 0.827318728, alpha: 1)
         $0.layer.borderWidth = 1.5
         return $0
     }(UIView())
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        let myFrame : CGRect = self.contentView.frame
        backView.frame = myFrame
        
        
        
        lbl.addSubview(backView)
        self.contentView.addSubview(backView)
        self.contentView.sendSubviewToBack(backView)
        
//
        selectBackView.frame = myFrame
     
        self.selectedBackgroundView = selectBackView
        self.contentView.addSubview(selectBackView)
        self.contentView.sendSubviewToBack(selectBackView)

    }
    
    
    
}

