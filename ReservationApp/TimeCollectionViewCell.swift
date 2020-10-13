

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    lazy var backView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 6
        $0.backgroundColor = .white
        $0.layer.borderColor = #colorLiteral(red: 0.2777451873, green: 0.8061931729, blue: 0.8352137804, alpha: 1)
        $0.layer.borderWidth = 1.5
        return $0
    }(UIView())
    
    
     override func awakeFromNib() {

           super.awakeFromNib()
           // Initialization code
        let myFrame : CGRect = self.contentView.frame
        backView.frame = myFrame



     timeLabel.addSubview(backView)
        self.contentView.addSubview(backView)
        self.contentView.sendSubviewToBack(backView)
       }
  


}
