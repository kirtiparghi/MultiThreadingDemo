//
//  SerialDispatchVC.swift
//  ConcurrencyDemo
//
//  Created by Kirti Parghi on 3/24/18.
//  Copyright © 2018 Kirti Parghi. All rights reserved.
//

import UIKit

class SerialDispatchVC: UIViewController {
    
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
        //MAKE SERIAL QUEUE AND EXECUTE TASKS
        let serialQueue = DispatchQueue(label: "queuename")
        serialQueue.async {
            let img = Downloader.downloadImageWithURL(url:imageURLs[0])
            DispatchQueue.main.async {
                self.imageView1.image = img
            }
        }
        serialQueue.async {
            let img = Downloader.downloadImageWithURL(url:imageURLs[1])
            DispatchQueue.main.async {
                self.imageView2.image = img
            }
        }
        serialQueue.async {
            let img = Downloader.downloadImageWithURL(url:imageURLs[2])
            DispatchQueue.main.async {
                self.imageView3.image = img
            }
        }
    }
}
