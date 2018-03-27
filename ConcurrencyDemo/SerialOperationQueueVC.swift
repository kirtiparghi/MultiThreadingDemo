//
//  SerialOperationQueueVC.swift
//  ConcurrencyDemo
//
//  Created by Kirti Parghi on 3/24/18.
//  Copyright © 2018 Kirti Parghi. All rights reserved.
//

import UIKit

class SerialOperationQueueVC: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backbtnTapped(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "mainvc")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func didClickOnStart(sender: AnyObject) {        
        //EXECUTE TASKS USING NSOPERATIONQUEUE
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount=1
        queue.addOperation {
            let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
            OperationQueue.main.addOperation({
                self.imageView1.image = img1
            })
        }
        
        queue.addOperation {
            let img1 = Downloader.downloadImageWithURL(url: imageURLs[1])
            OperationQueue.main.addOperation({
                self.imageView2.image = img1
            })
        }
        
        queue.addOperation {
            let img1 = Downloader.downloadImageWithURL(url: imageURLs[2])
            OperationQueue.main.addOperation({
                self.imageView3.image = img1
            })
        }
    }
}
