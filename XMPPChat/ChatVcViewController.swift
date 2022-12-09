//
//  ChatVcViewController.swift
//  XMPPChat
//
//  Created by Patel Meet on 08/12/22.
//

import UIKit

class ChatVcViewController: UIViewController {

    let list = ["The greatest glory in living lies not in never falling, but in rising every time we fall. -Nelson Mandela",
                "The way to get started is to quit talking and begin doing. -Walt Disney",
                "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking. -Steve Jobs",
                "If life were predictable it would cease to be life, and be without flavor. -Eleanor Roosevelt",
                "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough. -Oprah Winfrey",
                "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success. -James Cameron",
                "Life is what happens when you're busy making other plans. -John Lennon"]
    
    
    
    let tableChatCellName = "ChatTableViewCell";
    @IBOutlet weak var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        let chatTableNib = UINib(nibName: tableChatCellName, bundle: nil)
        chatTableView.register(chatTableNib, forCellReuseIdentifier: tableChatCellName)
        
        chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.rowHeight = 100
        
        self.navigationController?.isNavigationBarHidden = true
        
//        tempcollectionView.estima
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func OnClickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}




extension ChatVcViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableChatCellName) as! ChatTableViewCell
        
        let image = (indexPath.row % 2) == 0 ? UIImage(named: "chat_bubble_received") : UIImage(named: "chat_bubble_sent")
        
        cell.chatImageView.tintColor = (indexPath.row % 2) == 0 ? UIColor(named: "chat_bubble_color_received") : UIColor(named: "chat_bubble_color_sent")
        
        cell.checkMarkImage.isHidden = (indexPath.row % 2) == 0 ? true : false
    
       cell.chatImageView.image = image!
           .resizableImage(withCapInsets:
                               UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),
                                   resizingMode: .stretch)
           .withRenderingMode(.alwaysTemplate)
       
        cell.lblTitle.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let cell = tableView.dequeueReusableCell(withIdentifier: tableChatCellName) as! ChatTableViewCell
        return UITableView.automaticDimension
    }
    
}
