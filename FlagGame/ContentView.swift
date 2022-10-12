//
//  ContentView.swift
//  FlagGame
//
//  Created by Ajin on 12/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Argentina","Belgium","Canada","Denmark","Finland","India","Japan","Norway","Sweden"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State var showingScore = false
    @State var scoreTitle = ""
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 30){
                Group {
                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))

                }.foregroundColor(.white)
                                
                ForEach(0..<3){num in
                    
                    Button{
                        flagTapped(num)
                    }label: {
                        Image(countries[num])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                    
                }
            }
            
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        }
    }
    
    func flagTapped(_ number: Int){
        
        if number == correctAnswer{
            scoreTitle = "Correct"
        }else{
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
