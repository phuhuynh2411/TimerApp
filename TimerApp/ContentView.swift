//
//  ContentView.swift
//  TimerApp
//
//  Created by Huynh Tan Phu on 3/6/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var timeManager = TimeManager()
    @State var selectedPickerIndex = 0
    var avaiableMinutes = Array(1...59)
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text(self.timeManager.displayedSeconds)
                    .font(.system(size: 80))
                    .padding(.top, 80)
                
                Image(systemName: timeManager.timeMode == .running ? "pause.circle.fill": "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.orange)
                    .frame(width: 180, height: 180)
                    .onTapGesture {
                        if self.timeManager.timeMode == .initial {
                            self.timeManager.setTimerLength(seconds: self.avaiableMinutes[self.selectedPickerIndex]*60)
                        }
                        
                        self.timeManager.timeMode == .running ? self.timeManager.pause() : self.timeManager.start()
                        
                    }
                
                if timeManager.timeMode == .paused {
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                        .onTapGesture {
                            self.timeManager.reset()
                    }
                }
                
                if timeManager.timeMode == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0..<self.avaiableMinutes.count) {
                            Text("\(self.avaiableMinutes[$0]) min")
                        }
                    }
                    .labelsHidden()
                }
                
                Spacer()
            }
            .navigationBarTitle("My Timer")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
