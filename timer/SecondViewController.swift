//
//  SecondViewController.swift
//  timer
//
//  Created by Yernar Dyussenbekov on 11.10.2024.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var finishLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var startDate = Date()
    var finishDate = Date()
    var timerDate = Date()
    
    var timer = Timer()
    var isRuning = false

    override func viewDidLoad() {
        super.viewDidLoad()
        timerDate = startDate
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy, EE HH:mm"
    
        let startFormattedDate = formatter.string(from: startDate)
        startLabel.text = startFormattedDate
        
        let finishFormattedDate = formatter.string(from: finishDate)
        finishLabel.text = finishFormattedDate
        
        let timerFormattedDate = formatter.string(from: timerDate)
        timerLabel.text = timerFormattedDate
    }
    
    //принимает тип Date, возвращает преобразованный в формат String дату
    func dateFormat(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy, EE HH:mm"
        let timerFormattedDate = formatter.string(from: date)
        return(timerFormattedDate)
    }
    
    @objc func countTime(){
        //Если конечная дата достигнута, выводится соответствующее сообщение, по нажатию ОК сработает функция restart
        if timerDate > finishDate {
            print(timerDate)
            print(finishDate)
            timerLabel.text = dateFormat(date: timerDate)
            timer.invalidate()
            
            let alert = UIAlertController(title: "Timer", message: "Конечная дата достигнута!", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {UIActionHandler in
                self.restartTimer()
            } ))
            
            present(alert, animated: true)
            return
            
        }
        
        timerLabel.text = dateFormat(date: timerDate)
        timerDate += 1
        
    }
    
    @IBAction func start(_ sender: Any) {
        if isRuning {
            return
        }
        // Если начальная дата больше конечной - выводится соответствующее сообщение
        if startDate > finishDate {
            let alert = UIAlertController(title: "Timer", message: "Начальная дата должна быть меньше конечной даты", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: .none))
            present(alert, animated: true)
            return
        }
        
        //Запуск таймера, функция countTime
        timer = Timer.scheduledTimer(timeInterval: 0.00001, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        isRuning = true
    }
    
    func restartTimer(){
        timer.invalidate()
        timerDate = startDate
        isRuning = false
        timerLabel.text = dateFormat(date: timerDate)
    }
    
    @IBAction func restart(_ sender: Any) {
        restartTimer()
    }
    
    @IBAction func stop(_ sender: Any) {
        isRuning = false
        timer.invalidate()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
