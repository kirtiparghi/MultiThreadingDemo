//
//  SerialDispatchVC.swift
//  ConcurrencyDemo
//
//  Created by Kirti Parghi on 3/24/18.
//  Copyright © 2018 Kirti Parghi. All rights reserved.
//

import UIKit

class SerialDispatchVC: UIViewController {
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    
    var seconds1 = 1
    var timer1 = Timer()
    
    var seconds2 = 1
    var timer2 = Timer()
    
    var seconds3 = 1
    var timer3 = Timer()
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl1.text = "1"
        lbl2.text = "1"
        lbl3.text = "1"
        lbl1.isHidden = true
        lbl2.isHidden = true
        lbl3.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backbtnTapped(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "mainvc")
        self.present(controller, animated: true, completion: nil)
    }
    
    func runTimer1() {
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SerialDispatchVC.updateTimer1)), userInfo: nil, repeats: true)
    }
    
    func runTimer2() {
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SerialDispatchVC.updateTimer2)), userInfo: nil, repeats: true)
    }
    
    func runTimer3() {
        timer3 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SerialDispatchVC.updateTimer3)), userInfo: nil, repeats: true)
    }
    
    func updateTimer1() {
            seconds1 += 1
            lbl1.text = String(seconds1)
    }

    func updateTimer2() {
            seconds2 += 1
            lbl2.text = String(seconds2)
    }
    
    func updateTimer3() {
            seconds3 += 1
            lbl3.text = String(seconds3)
    }
    
    @IBAction func didClickOnStart(sender: AnyObject) {
        lbl1.isHidden = false
        lbl2.isHidden = false
        lbl3.isHidden = false
        
        //MAKE SERIAL QUEUE AND EXECUTE TASKS
        self.runTimer1()
        self.runTimer2()
        self.runTimer3()

        let serialQueue = DispatchQueue(label: "queuename")
        serialQueue.async {
            let img = Downloader.downloadImageWithURL(url:imageURLs[0])
            DispatchQueue.main.async {
                self.imageView1.image = img
                self.timer1.invalidate()
            }
        }
        
        serialQueue.async {
            let img = Downloader.downloadImageWithURL(url:imageURLs[1])
            DispatchQueue.main.async {
                self.imageView2.image = img
                self.timer2.invalidate()
            }
        }
        
        serialQueue.async {
            let img = Downloader.downloadImageWithURL(url:imageURLs[2])
            DispatchQueue.main.async {
                self.imageView3.image = img
                self.timer3.invalidate()
            }
        }
    }
}
