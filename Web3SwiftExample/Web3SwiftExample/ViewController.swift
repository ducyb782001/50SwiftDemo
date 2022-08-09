//
//  ViewController.swift
//  Web3SwiftExample
//
//  Created by MacOS on 02/08/2022.
//

import UIKit
import web3swift

class ViewController: UIViewController {
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var textViewTest: UITextView!
    @IBOutlet weak var table: UITableView!
    
    var models = [EachTransaction]()
    var balanceShow: String?
    
    var serviceRequest = Request();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addressTextField.delegate = self
        
        table.register(TransactionTableViewCell.nib(), forCellReuseIdentifier: TransactionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
        
        //        let web3 = Web3.InfuraMainnetWeb3()
        //        let address = EthereumAddress("0x71C7656EC7ab88b098defB751B7401B5f6d8976F")!
        //        do{
        //            print("Go 19")
        //            let balance = try web3.eth.getBalance(address: address)
        //            print("Go 21")
        //            let balanceString = Web3.Utils.formatToEthereumUnits(balance, toUnits: .eth, decimals: 3)
        //            print("Go 23")
        //            if let balanceString = balanceString {
        //                print("-------------------- \(balanceString) --------------------")
        //                balanceShow = balanceString
        //            }
        //        } catch {
        //            print("Go Error")
        //            print(error)
        //        }
        
        //        print("------------------------Transaction of address----------------------------------")
        //        let stringAddress = Constants.fullUrl
        //        serviceRequest.testGeneric(stringAddress) { [self] (transactionResponse: TransactionResponse) in
        //            if let result = transactionResponse.result {
        //                models.append(contentsOf: result)
        //                print("O day co: \(result.count)")
        //            } else {
        //                print("Sai mat r")
        //            }
        //        }
        
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        let web3 = Web3.InfuraMainnetWeb3()
        let addressInput = addressTextField.text ?? "0"
        let address = EthereumAddress(addressInput)!
        print("------------------------Transaction of address----------------------------------")
        let fullUrl: String = "\(Constants.baseUrl + addressInput + Constants.endpointUrl + Constants.apiKey)"
        serviceRequest.testGeneric(fullUrl) { [self] (transactionResponse: TransactionResponse) in
            if let result = transactionResponse.result {
                models.append(contentsOf: result)
                print("O day co: \(result.count)")
            } else {
                print("Sai mat r")
            }
        }
        do{
            print("Go 19")
            let balance = try web3.eth.getBalance(address: address)
            print("Go 21")
            let balanceString = Web3.Utils.formatToEthereumUnits(balance, toUnits: .eth, decimals: 3)
            print("Go 23")
            if let balanceString = balanceString {
                print("-------------------- \(balanceString) --------------------")
                balanceShow = balanceString
            }
        } catch {
            print("Go Error")
            print(error)
        }
        if let balanceShow = balanceShow {
            textViewTest.text = "$ \(balanceShow)"
        } else {
            textViewTest.text = "$ 0"
        }
        DispatchQueue.main.async {
            self.table.reloadData()
        }
//        if let balanceShow = balanceShow {
//            textViewTest.text = "$ \(balanceShow)"
//        } else {
//            textViewTest.text = "$ 0"
//        }
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == addressTextField {
            textField.resignFirstResponder()
            return false
        }
        return true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as! TransactionTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
