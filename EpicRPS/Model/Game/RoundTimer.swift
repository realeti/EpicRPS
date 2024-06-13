//
//  RoundTimer.swift
//  EpicRPS
//
//  Created by Алексей on 13.06.2024.
//

import UIKit

final class RoundTimer {
    var timer: Timer?
    var isPaused = false
    var roundDuration = 30
    private var totalProgressTime = 30
    private var progressTime: Float = 0
    
    func startTimer(label: UILabel, progress: UIProgressView) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self else { return }
            roundDuration -= 1
            label.text = "0:\(roundDuration)"
            
            progressTime += 1
            let percentageProgress = progressTime / Float(totalProgressTime)
            progress.setProgress(percentageProgress, animated: true)
           
            if roundDuration <= 0 {
                timer?.invalidate()
                timer = nil
                progressTime = 0
            }
        })
    }
    
    func resetTimer(label: UILabel, progress: UIProgressView) {
        timer?.invalidate()
        roundDuration = 30
        progressTime = 0
        label.text = "0:" + roundDuration.description
        progress.progress = 0
    }
    
    func pauseTimer(){
        timer?.invalidate()
    }
}
