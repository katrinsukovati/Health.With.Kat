//
//  TimerViewController.swift
//  Health.With.Kat
//
//  Created by Katrin Sukovati on 2020-10-24.
//  Copyright © 2020 Katrin Sukovati. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var minuteLbl: UILabel!
    @IBOutlet weak var secondsLbl: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var lapBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var hours = 0
    var minutes = 0
    var seconds = 0
    
    var lappedTimes:[String]=[]
    
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetTimer(){
        hours = 0
        minutes = 0
        seconds = 0
        lappedTimes = []
        timer.invalidate()
        secondsLbl.text = "00"
        minuteLbl.text = "00"
        hourLbl.text = "00"
        tableView.reloadData()
    }
    
    @IBAction func start(_ sender: UIButton) {
        //starting the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
    }
    
    @objc fileprivate func count(){
        seconds += 1
        if seconds == 60{
            minutes += 1
            seconds = 0
        }
        if minutes == 60{
            hours += 1
            minutes = 0
            seconds = 0
        }
        
        if hours == 24{
            resetTimer()
        }
        
        if 0 <= seconds && seconds <= 9{
            secondsLbl.text = "0\(seconds)"
        }
        else{
            secondsLbl.text = "\(seconds)"
        }
        
        if 0 <= minutes && minutes <= 9{
            minuteLbl.text = minutes == 0 ? "00" : "0\(minutes)"
        }
        else{
            minuteLbl.text = minutes == 0 ? "00" : "\(minutes)"
        }
        
        if 0 <= hours && hours <= 9{
            hourLbl.text = hours == 0 ? "00" : "0\(hours)"
        }
        else{
            hourLbl.text = hours == 0 ? "00" : "\(hours)"
        }
    }
    
    @IBAction func lap(_ sender: UIButton) {
        let currentTime = "\(hours):\(minutes):\(seconds)"
        lappedTimes.append(currentTime)
        
        let indexPath = IndexPath(row: lappedTimes.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
    @IBAction func pause(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func reset(_ sender: UIButton) {
        resetTimer()
    }
    
    
}

// UI Table
extension TimerViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lappedTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell", for: indexPath)
        cell.textLabel?.text = lappedTimes[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            lappedTimes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
