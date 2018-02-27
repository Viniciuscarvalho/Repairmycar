import UIKit
import CoreLocation
import GoogleMaps

protocol ListCarWorkshopsDelegate: class {
    func didList(workshops: [CarWorkshopViewModel])
}

final class ListCarWorkshopsViewController: UIViewController, ListCarWorkshopsDelegate {
    var userLocationGateway: UserLocationGateway!
    
    private var cellIdentifier = String(describing: CarWorkshopsTableViewCell.self)

    @IBOutlet weak var tableView: UITableView!
    
    private var tableViewDelegate: CarWorkshopDelegate? = nil
    private var listCarWorkshopsInteractor: ListCarWorkshopsInteractor?
    
    init(userLocationGateway: UserLocationGateway) {
        super.init(nibName: nil, bundle: nil)
        self.userLocationGateway = userLocationGateway
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCarWorkshopsInteractor()
    }
    
    private func configureTableView() {
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)

    }
    private func configureCarWorkshopsInteractor() {
        listCarWorkshopsInteractor = ListCarWorkshopsFactory.make(presenter: CarWorkshopPresenter(delegate: self))
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        listCarWorkshopsInteractor?.list()
    }
    
    func didList(workshops: [CarWorkshopViewModel]) {
        
    }
    
}

