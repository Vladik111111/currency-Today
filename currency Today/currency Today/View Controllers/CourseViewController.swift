//
//  CourseViewController.swift
//  currency Today
//
//  Created by Student on 02.07.25.
//

import UIKit
class CoursOption{
    var name: String
    var currency: String
    var course:String
    var backgroundColor:UIColor
    var backgroundImage:UIImage
    
    init(name: String, currency: String, course: String, backgroundColor: UIColor, backgroundImage:UIImage) {
        self.name = name
        self.currency = currency
        self.course = course
        self.backgroundColor = backgroundColor
        self.backgroundImage = backgroundImage
    }
}
class CourseViewController: UIViewController {
    
    @IBOutlet weak var date: UINavigationBar!
    
    @IBOutlet weak var tableView: UITableView!
    var models = [CoursOption]()
    var volues:[Double] = []
    var currencyCode:[String] = []
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CoursTableViewCell.self, forCellReuseIdentifier: CoursTableViewCell.identifier)
        currentData()
        fetchJson()
        configure()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    func currentData(){
        var now = Date()
        var nowComponents = DateComponents()
        let calendar = Calendar.current
        nowComponents.year = Calendar.current.component(.year, from: now)
        nowComponents.month = Calendar.current.component(.month, from:now)
        nowComponents.day = Calendar.current.component(.day, from:now)
        nowComponents.timeZone = NSTimeZone.local
        now = calendar.date(from:nowComponents)!
        date.topItem?.title = "\(nowComponents.day!).\(nowComponents.month!).\(nowComponents.year!)"
    }
    
    @IBAction func SettingButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SettingstViewController") as? SettingsViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
        
        
    }
    
    
    func configure(){
        
        models.append(contentsOf: [
            CoursOption(name: "AMD", currency:"Armenia", course: "1", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!),
            CoursOption(name: "RUB", currency:"Russian", course: "1", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!),
            CoursOption(name: "USD", currency:"USA", course: "1", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!),
            CoursOption(name: "EUR", currency:"Europa", course: "1", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!),
            CoursOption(name: "GEL", currency:"Georgia", course: "1", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!),
            CoursOption(name: "CAD", currency:"Kanada", course: "1", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!),
            CoursOption(name: "QAR", currency:"Qatar", course: "1", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!),
            CoursOption(name: "IRR", currency:"India", course: "1", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!),
            CoursOption(name: "UAH", currency:"Ukraine", course: "1", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!),
            CoursOption(name: "BRL", currency:"Brazil", course: "1", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!),
        ])
      
      
    }
    
    func fetchJson() {
            guard let url = URL(string: "https://open.er-api.com/v6/latest/AMD") else { return }
            URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                guard let safeData = data else { return }
                
                do {
                    let rezults = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                    self.currencyCode.append(contentsOf: rezults.rates.keys)
                    self.volues.append(contentsOf: rezults.rates.values)
                    rezults.rates.forEach {(key, value) in
                        self.models = self.models.map {
                            if $0.name == key {
                                let courseKey = (Double(models[0].course) ?? 0)/value
                                $0.course = "\(Double(round(100 * courseKey) / 100))"
                            }
                            return $0
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                catch {
                    print(error)
                }
            }.resume()
        }
    
    
    
    
    
    @IBAction func ConvertButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ConvertViewController") as? ConvertViewController
        vc?.modalTransitionStyle = .flipHorizontal
        vc?.modalPresentationStyle = .overCurrentContext
        self.present(vc!, animated: true)
    }    /*
          // MARK: - Navigation
          
          // In a storyboard-based application, you will often want to do a little preparation before navigation
          override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          // Get the new view controller using segue.destination.
          // Pass the selected object to the new view controller.
          }
          */
}
    extension CourseViewController:
        UITableViewDelegate,
        UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = models[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier:CoursTableViewCell.identifier , for: indexPath) as? CoursTableViewCell
            else{
                return UITableViewCell()
            }
            cell.configure(width: model)
            return cell
        }
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 70
            }
            
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    
