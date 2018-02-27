import UIKit
import CoreLocation
import GoogleMaps

protocol ListCarWorkshopsDelegate: class {
    func didList(workshops: [CarWorkshopViewModel])
}

final class ListCarWorkshopsViewController: UIViewController, ListCarWorkshopsDelegate {
    
    private var cellIdentifier = String(describing: CarWorkshopsTableViewCell.self)

    @IBOutlet weak var tableView: UITableView!
    
    var userLocationGateway: UserLocationGateway!
    private var tableViewDelegate: CarWorkshopDelegate? = nil
    private lazy var tableViewDatasource = CarWorkshopsDatasource<CarWorkshopViewModel, CarWorkshopsTableViewCell> { (carWorkshops, cell) in
        cell.configure(workshops: carWorkshops)
    }
    
    private var listCarWorkshopsUseCase: ListCarWorkshopsUseCase?
    
    init(userLocationGateway: UserLocationGateway) {
        super.init(nibName: "ListCarWorkshopsViewController", bundle: nil)
        self.userLocationGateway = userLocationGateway
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCarWorkshopsUseCase()
        configureTableView()
    }
    
    private func configureTableView() {
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
        configureTableViewDatasource()
        configureTableViewDelegate()

    }
    private func configureCarWorkshopsUseCase() {
        listCarWorkshopsUseCase = ListCarWorkshopsFactory.make(presenter: CarWorkshopPresenter(delegate: self))
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        listCarWorkshopsUseCase?.list()
    }
    
    private func configureTableViewDatasource() {
        tableView.dataSource = tableViewDatasource
    }
    
    private func configureTableViewDelegate() {
        tableViewDelegate = CarWorkshopDelegate(selectedRow: { row in
            if let navigationController = self.navigationController {
                let workshops: CarWorkshopViewModel = self.tableViewDatasource.objects[row]
                CarworkshopsNavigation(navigationController: navigationController).carWorkshopsDetail(workshops: workshops)
            }
        })
        tableView.delegate = tableViewDelegate
    }

    func didList(workshops: [CarWorkshopViewModel]) {
        self.tableViewDatasource.objects = self.tableViewDatasource.objects + workshops
        tableView.reloadData()
    }
    
}

