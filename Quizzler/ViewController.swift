//
//  ViewController.swift
//  Quizzler

import UIKit

class ViewController: UIViewController {
        
    let allQuestions = QuestionBank() //create a list of all questions
    var choosenAnswer : Bool = false
    var questionNo : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    // This gets called when the UIViewController is loaded into memory when the app starts
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            choosenAnswer = true
            
        }else if sender.tag == 2 {
            choosenAnswer = false
        }
        
        checkAnswer()

        questionNo += 1
        nextQuestion()
    }
    
    
    func updateUI() {
      
        scoreLabel.text = "Current Score: \(score)"
        progressLabel.text = "Your progress : \(questionNo + 1) / 13"
        
        progressBar.frame.size.width = CGFloat(questionNo + 1) * (view.frame.size.width / 13) // update progress bar size. CGFloat() to convert Int
    }
    

    func nextQuestion() {
        
        if questionNo <= 12 {
            
            questionLabel.text = allQuestions.list[questionNo].questionText // update question
            updateUI()
            
        }else{
            
            let alert = UIAlertController(title: "You've answered all questions!", message: "Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:{ (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction) // add action to alert
            
            present(alert, animated: true, completion: nil) // present alert to the viewer
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNo].answer // get the answer of a question
        
        if correctAnswer == choosenAnswer {
            score += 1
            print("You're correct!")
        }else{
            print("Wrong answer.")
        }
    }
    
    
    func startOver() {
       questionNo = 0
       score = 0
       nextQuestion()
    }
}
