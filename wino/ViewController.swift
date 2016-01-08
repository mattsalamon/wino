//
//  ViewController.swift
//  wino
//
//  Created by msalamon on 1/5/16.
//  Copyright © 2016 msalamon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let userCalendar = NSCalendar.currentCalendar()
    
    var buttonDate: NSDate!
    
    var persButtonDate: AnyObject!
    
    let resetString = "7 Days: 0 Hours: 0 Mins: 0 Secs"
    
    var total = 0
    
    var persTotal = 0
    
    
    @IBOutlet var dayLabel: UILabel!
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var wine7: UILabel!
    
    @IBOutlet var wineLabel7: UILabel!
    
    @IBOutlet var wine6: UILabel!
    
    @IBOutlet var wineLabel6: UILabel!
    
    @IBOutlet var wine5: UILabel!
    
    @IBOutlet var wineLabel5: UILabel!
    
    @IBOutlet var wine4: UILabel!
    
    @IBOutlet var wineLabel4: UILabel!
    
    @IBOutlet var wine3: UILabel!
    
    @IBOutlet var wineLabel3: UILabel!
    
    @IBOutlet var wine2: UILabel!
    
    @IBOutlet var wineLabel2: UILabel!
    
    @IBOutlet var wine1: UILabel!
    
    @IBOutlet var wineLabel1: UILabel!
    
    @IBOutlet var totalLabel: UILabel!
    
    @IBOutlet var totalNumLabel: UILabel!
    
    
    @IBOutlet var lastOpenLabel: UILabel!
    

    @IBAction func button(sender: AnyObject) {
        
        
        buttonDate = NSDate()
        
        // creates persistent object and key
        NSUserDefaults.standardUserDefaults().setObject(buttonDate, forKey: "buttonDate")
        
        addBottle()
        
        bottleEmpty(false)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //use this to remove persistent data store (for testing)
        // NSUserDefaults.standardUserDefaults().removeObjectForKey("total")
        
        // NSUserDefaults.standardUserDefaults().removeObjectForKey("buttonDate")
        
        let currentDate = NSDate()
        
        print(currentDate)
        
    
        animateDayLabel()
        
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("buttonDate") != nil) {
            
            //gets persistent object from key that we give
            persButtonDate = NSUserDefaults.standardUserDefaults().objectForKey("buttonDate")! as! NSDate
            
          let goodPersButtonDate = persButtonDate! as! NSDate
            
            let hardDiff = Int(currentDate.timeIntervalSinceDate(goodPersButtonDate))
            
            print(hardDiff)
            
            if (hardDiff >= 0 && hardDiff <= 604800)  {
                
                button.hidden = true
                
                if (hardDiff >= 604800) {
                    wine1.hidden = true
                    eraseLabels()
                    
                }
                if hardDiff >= 518400 {
                    wine2.hidden = true
                    
                }
                if hardDiff >= 432000 {
                    wine3.hidden = true
                    
                }
                if hardDiff >= 345600 {
                    wine4.hidden = true
                    
                }
                if hardDiff >= 259200 {
                    wine5.hidden = true
                    
                }
                if hardDiff >= 172800 {
                    wine6.hidden = true
                    
                }
                if hardDiff >=  86400{
                    wine7.hidden = true
                    
                }
                
                if hardDiff >= 1 && hardDiff <= 86400 {
                    
                    eraseLabels()
                    wineLabel7.hidden = false
                }
                
                if hardDiff >= 86400 && hardDiff < 172800 {
                    
                    eraseLabels()
                    wineLabel6.hidden = false
                }
                
                if hardDiff >= 172800 && hardDiff < 259200 {
                    
                    eraseLabels()
                    wineLabel5.hidden = false
                }
                
                if hardDiff >= 259200 && hardDiff < 345600 {
                    
                    eraseLabels()
                    wineLabel4.hidden = false
                }
                
                if hardDiff >= 345600 && hardDiff < 432000 {
                    
                    eraseLabels()
                    wineLabel3.hidden = false
                }
                
                if hardDiff >= 432000 && hardDiff < 518400 {
                    
                    eraseLabels()
                    wineLabel2.hidden = false
                }
                
                if hardDiff >= 518400 && hardDiff < 604800 {
                    
                    eraseLabels()
                    wineLabel1.hidden = false
                }
            
                let components: NSCalendarUnit = [.Day, .Hour, .Minute, .Second]
            
                let diff = userCalendar.components(components, fromDate: goodPersButtonDate, toDate: currentDate, options: [])
            
                print(goodPersButtonDate)
                
                let formatter = NSDateFormatter()
                formatter.dateStyle = .LongStyle
                formatter.timeStyle = .ShortStyle
                print(formatter.stringFromDate(goodPersButtonDate))
            
                lastOpenLabel.text = "Bottle Opened \(formatter.stringFromDate(goodPersButtonDate))"
                
                dayLabel.text = "\(String(6 - diff.day)) Days, \(String(23 - diff.hour)) Hours, \(String(59 - diff.minute)) Mins, \(String(59 - diff.second)) Secs"
            }
                
            else {
                bottleEmpty(true)
            }
        }
        
        // bottleEmpty(true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.se
    }
    
    func addBottle() {
        
        // creates persistent object and key
        persTotal =  NSUserDefaults.standardUserDefaults().integerForKey("total")
        
        NSUserDefaults.standardUserDefaults().setInteger(persTotal + 1, forKey: "total")
        
        persTotal =  NSUserDefaults.standardUserDefaults().integerForKey("total")
        
    }

    func bottleEmpty(arg: Bool) {
        wine7.hidden = arg
        wine6.hidden = arg
        wine5.hidden = arg
        wine4.hidden = arg
        wine3.hidden = arg
        wine2.hidden = arg
        wine1.hidden = arg
        
        if arg {
            dayLabel.text = "TIME TO OPEN A NEW BOTTLE!"
        
            button.hidden = false
            
            eraseLabels()
            
            
        }
        else {
            
            dayLabel.text = resetString
            
            button.hidden = true
            
            eraseLabels()
            
            wineLabel7.hidden = false
        }
        
        animateDayLabel()
    }
    
    func eraseLabels() {
        
        wineLabel7.hidden = true
        wineLabel6.hidden = true
        wineLabel5.hidden = true
        wineLabel4.hidden = true
        wineLabel3.hidden = true
        wineLabel2.hidden = true
        wineLabel1.hidden = true
        
    }
    
    func animateDayLabel() {
        
        persTotal = NSUserDefaults.standardUserDefaults().integerForKey("total")
        
        totalNumLabel.text = "\(persTotal)"
        
       
        if (NSUserDefaults.standardUserDefaults().objectForKey("buttonDate") != nil) {
        //gets persistent object from key that we give
        persButtonDate = NSUserDefaults.standardUserDefaults().objectForKey("buttonDate")! as! NSDate
        
        let goodPersButtonDate = persButtonDate! as! NSDate
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .LongStyle
        formatter.timeStyle = .ShortStyle
        print(formatter.stringFromDate(goodPersButtonDate))
        
        lastOpenLabel.text = "Bottle Opened \(formatter.stringFromDate(goodPersButtonDate))"
        }
        
        // if no button Date has ever been created--ie first time the app is loaded
        else {
            lastOpenLabel.text = "Let's Get Started!"
            eraseLabels()
            wineLabel7.hidden = false
            dayLabel.text = "Start Your First Bottle Bitch!"
        }
        
        
        UIView.animateWithDuration(1.5, animations: {
            
            self.dayLabel.center.x += self.view.bounds.width
            
        })
        
        
        UIView.animateWithDuration(0.5, delay: 1.4, options: [], animations: {
            
            self.totalLabel.center.x += self.view.bounds.width
            
        }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 2.1, options: [], animations: {
            
            self.totalNumLabel.center.x -= self.view.bounds.width
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 2.8, options: [], animations: {
            
            self.lastOpenLabel.center.x -= self.view.bounds.width
            
            }, completion: nil)
    }
    
    
    

}

