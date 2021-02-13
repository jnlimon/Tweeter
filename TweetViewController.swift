//
//  TweetViewController.swift
//  Tweeter
//
//  Created by J6 on 2/10/21.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
    }
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true,
                completion: nil)
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: { self.dismiss(animated: true, completion: nil)}, failure: { (error) in print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
