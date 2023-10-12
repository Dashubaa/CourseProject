import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet var infoOutlet: UIButton!
    @IBOutlet var projectNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    public func refresh(_ model: Project){
        projectNameLabel.text = model.nameProject
    }
}
