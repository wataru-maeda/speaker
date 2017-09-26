//
//  Speaker.swift
//  Speaker
//
//  Created by Wataru Maeda on 2017/09/25.
//  Copyright © 2017 Wataru Maeda. All rights reserved.
//

import UIKit
import AVFoundation

// MARK: - Accessor

class Speaker {
  // Speak based on Country Code
  class func speech(text: String,
                    language: String,
                    interrupt: Bool = false,
                    rate: Float = AVSpeechUtteranceDefaultSpeechRate,
                    pitch: Float = 1.0,
                    started: @escaping ()->() = {},
                    finished: @escaping ()->() = {}) {
    Speech.shared.speak(
      text: text,
      language: language,
      interrupt: interrupt,
      rate: rate,
      pitch: pitch,
      started: started,
      finished: finished
    )
  }
  
  // Speak based on Country
  class func speech(text: String,
                    country: Country,
                    interrupt: Bool = false,
                    rate: Float = 0.0,
                    pitch: Float = 1.0,
                    started: @escaping ()->() = {},
                    finished: @escaping ()->() = {}) {
    Speech.shared.speak(
      text: text,
      language: country.rawValue,
      interrupt: interrupt,
      rate: rate,
      pitch: pitch,
      started: started,
      finished: finished)
  }
  
  // Play audio with resorce and type
  class func play(resource: String,
                  type: String,
                  finished: @escaping ()->() = {}) {
    AudioPlayer.shared.play(
      resource: resource,
      type: type,
      finished: finished
    )
  }
}

// MARK: - Speech

class Speech: NSObject, AVSpeechSynthesizerDelegate {
  static var shared = Speech()
  private override init() {}
  fileprivate lazy var speech = AVSpeechSynthesizer()
  fileprivate lazy var started: ()->() = {}
  fileprivate lazy var finished: ()->() = {}
  
  func speak(
    text: String,
    language: String,
    interrupt: Bool,
    rate: Float,
    pitch: Float,
    started: @escaping ()->(),
    finished: @escaping ()->()) {
    if speech.isSpeaking && interrupt {
      speech.stopSpeaking(at: .immediate)
    }
    self.started = started
    self.finished = finished
    speech.delegate = self
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: language)
    utterance.rate = rate
    utterance.pitchMultiplier = pitch
    speech.speak(utterance)
  }
  
  // MARK: AVSpeechSynthesizerDelegate
  
  func speechSynthesizer(
    _ synthesizer: AVSpeechSynthesizer,
    didStart utterance: AVSpeechUtterance) {
    started()
  }
  
  func speechSynthesizer(
    _ synthesizer: AVSpeechSynthesizer,
    didFinish utterance: AVSpeechUtterance) {
    finished()
  }
}

// MARK: - Audio

class AudioPlayer: NSObject, AVAudioPlayerDelegate {
  static var shared = AudioPlayer()
  private override init() {}
  fileprivate lazy var finished: ()->() = {}
  fileprivate lazy var audioPlayer = AVAudioPlayer()
  
  func play(resource: String,
            type: String,
            finished: @escaping ()->()) {
    guard let audioPath = Bundle.main.path(forResource: resource, ofType:type) else {
      return print("Audio not found")
    }
    self.finished = finished
    play(path: audioPath)
  }
  
  // MARK: AVAudioPlayerDelegate
  
  fileprivate func play(path: String) {
    let audioUrl = URL(fileURLWithPath: path)
    do {
      self.audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
      self.audioPlayer.delegate = self
    } catch let error as NSError {
      print(error)
    }
    audioPlayer.play()
  }
  
  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    finished()
  }
}

// MARK: - Countries

public enum Country: String {
  case SaudiArabia = "ar-SA"
  case China = "zh-CN"
  case HongKong = "zh-HK"
  case Taiwan = "zh-TW"
  case Czech = "cs-CZ"
  case Denmark = "da-DK"
  case Belgium = "nl-BE"
  case Netherlands = "nl-NL"
  case Australia = "en-AU"
  case Ireland = "en-IE"
  case SouthAfrica = "en-ZA"
  case UK = "en-GB"
  case US = "en-US"
  case Finland = "fi-FI"
  case Canada = "fr-CA"
  case France = "fr-FR"
  case Germany = "de-DE"
  case Greece = "el-GR"
  case Israel = "he-IL"
  case India = "hi-IN"
  case Hungary = "hu-HU"
  case Indonesia = "id-ID"
  case Italy = "it-IT"
  case Japan = "ja-JP"
  case SouthKorea = "ko-KR"
  case Norway = "no-NO"
  case Poland = "pl-PL"
  case Brazil = "pt-BR"
  case Portugal = "pt-PT"
  case Romania = "ro-RO"
  case Russia = "ru-RU"
  case Slovakia = "sk-SK"
  case Mexico = "es-MX"
  case Spain = "es-ES"
  case Sweden = "sv-SE"
  case Thailand = "th-TH"
  case Turkey = "tr-TR"
}
