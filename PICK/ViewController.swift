//
//  ViewController.swift
//  PICK
//
//  Created by Sri Andeani on 09/04/20.
//  Copyright © 2020 Sri Andeani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let MAXTIME : Float = 3.0
    var currentTime : Float = 0.0
    
    @IBOutlet weak var ProgressViewTiga: UIProgressView!
    @IBOutlet weak var progressViewEmpat: UIProgressView!
    @IBOutlet weak var progressViewLima: UIProgressView!
    
    @IBOutlet weak var tigaScore: UILabel!
    var score = 0
    
    
    //@IBOutlet weak var blackBtn: UIImageView!
    
    
    @IBOutlet weak var mainScreen: UIView!
    @IBOutlet weak var screenDua: UIView!
    @IBOutlet weak var screenTiga: UIView!
    @IBOutlet weak var screenEmpat: UIView!
    @IBOutlet weak var screenLima: UIView!
    
   // var randomScreenTiga = ["SoundJogi", "SoundJason", "SoundHarvi", "SoundDian", "SoundAgus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tigaScore.isHidden = true //tambah
        mainScreen.isHidden=false
        screenDua.isHidden=true
        screenTiga.isHidden=true
        screenEmpat.isHidden=true
        screenLima.isHidden=true
        score = 0
        tigaScore.text = "score : \(score)" //tambah
        if currentTime >= MAXTIME {
            
            score += 10
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonStart(_ sender: UIButton) {
        screenDua.isHidden=false
        ProgressViewTiga.setProgress(currentTime, animated: true)
        progressViewEmpat.setProgress(currentTime, animated: true)
        progressViewLima.setProgress(currentTime, animated: true)
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        tigaScore.isHidden = false //tambah
        tigaScore.text = "score : 0"
        screenTiga.isHidden=false
        updateProgress(direct: false)
//        perform(#selector(updateProgress), with: true, afterDelay: 1.0)
        
    }

//screen tiga
    @IBAction func orangeButton(_ sender: UIButton) {
        addScore()
        screenEmpat.isHidden=false
//        progressViewEmpat.setProgress(currentTime, animated: true)
//        perform(#selector(updateProgress), with: nil, afterDelay: 1.0)
    }
//    @IBAction func tambahScore(_ sender: Any) {
//        score += 1
//        tigaScore.text = "score : \(score)"
//    }
    @IBAction func blueButton(_ sender: UIButton) {
        screenEmpat.isHidden=true
        
    }
    
//screen empat
    @IBAction func yellowButton(_ sender: UIButton) {
        screenLima.isHidden=true
    }
    @IBAction func greenButton(_ sender: UIButton) {
        addScore()
        screenLima.isHidden=false
        
//        perform(#selector(updateProgress), with: nil, afterDelay: 1.0)
    }
   
    
//screen Lima
    @IBAction func greyButton(_ sender: UIButton) {
        mainScreen.isHidden=true
    }
    @IBAction func blackButton(_ sender: UIButton) {
        addScore()
        mainScreen.isHidden=false
        screenDua.isHidden=true
        screenTiga.isHidden=true
        screenEmpat.isHidden=true
        screenLima.isHidden=true
        mainScreen.isHidden=false
        tigaScore.isHidden = true
//        progressViewLima.setProgress(currentTime, animated: true)
//        perform(#selector(updateProgress), with: nil, afterDelay: 1.0)
    }

//
    @objc func updateProgress(direct: Bool){
        print(direct)
        if (direct) {
         currentTime += 1.0
        }
        ProgressViewTiga.progress = currentTime/MAXTIME
        progressViewEmpat.progress = currentTime/MAXTIME
        progressViewLima.progress = currentTime/MAXTIME
        print(currentTime)
        if currentTime < MAXTIME{
//            perform(#selector(updateProgress), with: nil, afterDelay: 1.0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.updateProgress(direct: true);
            }
        }else{
            currentTime = 0.0
        }
//        if (currentTime >= 3) {
//
//            score += 10
//        }
    }
    
    func addScore () {
        print("executed")
        score += 1
        tigaScore.text = "score : \(score)" //tambah
        currentTime = 0.0
//        perform(#selector(updateProgress), with: nil, afterDelay: 1.0)
        updateProgress(direct: false)
    }
    
    // ini adalah komentas
    
}

