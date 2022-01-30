//
//  AthkarDetailsRow.swift
//  Zikr Azker (iOS)
//
//  Created by Yousra Ahmed on 19/01/2022.
//

import SwiftUI
import AVFoundation

struct AthkarDetailsRow: View {
    var zikr:Zikr
    @State var isPlaying = false
    @State var counter:Int = 0
    @State var showTranslation = false
    @State var audioPlayer:AVAudioPlayer?
//    @State var remoteAudioUrl: URL?
    //@State var zikrSound: AVPlayer?
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
              //.listRowBackground(Color(hex: 0xFFFFFF, alpha: 0.0))
                .fill(Color(hex: 0xFFFFFF, alpha: 0.1))
            VStack(){
                Text(zikr.arabicText)
                    .padding()//.background(secondry800)
                Divider()
                if self.showTranslation{
                    Text(zikr.languageArabicTranslatedText)
                        .padding()//.background(secondry600)
                    Divider()
                    Text(zikr.translatedText)
                        .padding()//.background(secondry400)
                    Divider()
                }
                HStack{
                    Spacer()
                    Button(action: {
                        showTranslation = !showTranslation
                    }, label: {
                        Image("icons8-globe-100-4")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fill)
                    })
                    .frame(width: 28, height: 28 , alignment: .center)
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    Spacer()
                    Button(action: {
                        if zikr.repeatNum > counter{
                            counter += 1
                        }
                    }, label: {
                        Text("\(zikr.repeatNum) \\ \(counter)")
                            .fontWeight(.bold)
                                .font(.title2)
                                .foregroundColor(.white)

                                .frame(width: 100, height: 100 , alignment: .center)
                                .overlay(
                                    Circle()
                                    .stroke(secondry600, lineWidth: 3))
                    
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    Spacer()
                    Button(action: {
                       isPlaying = !isPlaying
                        playAudio (urlAudio: zikr.audio)

                    }, label: {
                        
                        Image(isPlaying ? "pause":"play")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fill)
                    })
                    .frame(width: 28, height: 28 , alignment: .center)
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    .task {
                        if audioPlayer == nil {
                            await loadData()
                        }
                    }
                    Spacer()
                }
                //.background(primary900)
            //    .background(secondry600)
               // .foregroundColor(primary900)
                .frame( height: 120 , alignment: .center)
            }
            .foregroundColor(secondry400) //chnge text
        }

     //   .background(popoverColor)
    }
    func loadData() async{
        
        if let audioUrl = URL(string: zikr.audio) {
            
            // then lets create your document folder url
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            // lets create your destination file url
            let destinationUrl = documentsDirectoryURL.appendingPathComponent(audioUrl.lastPathComponent)
            print(destinationUrl)
            
            // to check if it exists before downloading it
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                print("The file already exists at path")
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: destinationUrl)
                //    guard let player = audioPlayer else { return }
                    
                //    player.prepareToPlay()
               //     player.play()
                } catch let error {
                    print(error.localizedDescription)
                }
                
                // if the file doesn't exist
            } else {
                
                // you can use NSURLSession.sharedSession to download the data asynchronously
                URLSession.shared.downloadTask(with: audioUrl, completionHandler: { (location, response, error) -> Void in
                    guard let location = location, error == nil else { return }
                    do {
                        // after downloading your file you need to move it to your destination url
                        try FileManager.default.moveItem(at: location, to: destinationUrl)
                        print("File moved to documents folder")
                        do {
                            audioPlayer = try AVAudioPlayer(contentsOf: destinationUrl)
                        //    guard let player = audioPlayer else { return }
                            
                        //    player.prepareToPlay()
                       //     player.play()
                        } catch let error {
                            print(error.localizedDescription)
                        }
                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                }).resume()
            }
        }
   /*     let remoteURL = URL(string: zikr.audio)!
            let task = URLSession.shared.downloadTask(with: remoteURL) { data, response, error in
                guard let data = data, error == nil else {return}
                remoteAudioUrl = data
                do {
                    let player = try AVAudioPlayer(contentsOf: data)//destinationUrl)
                    player.prepareToPlay()
                    player.play()
                } catch let error {
                    print(error.localizedDescription)
                }
  //              if isPlaying{
  //                  playAudio (urlAudio: data)
  //              }
            }
            task.resume()*/
        }
    func playAudio (urlAudio: String){

           guard let player = audioPlayer else {
               print("error in playing audio")
               return }

           if isPlaying  {player.pause()}
            else {player.play()}


    }
}
/*
struct AthkarDetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        AthkarDetailsRow(zikr: Zikr(from: <#Decoder#>))
    }
}
*/
