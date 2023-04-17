//
//  JournalView.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/13/23.
//

import SwiftUI

struct JournalView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("You are incredible")
                    .font(.headline)
                    .padding(.bottom, 150.0)
                ZStack{
                    Ellipse()
                        .fill(
                                RadialGradient(
                                    gradient: Gradient(colors: [.purple, .white]),
                                    center: .center,
                                    startRadius: 0,
                                    endRadius: 150
                                ))
                        .frame(width: 350, height: 250)
                    
                    
                    Image(systemName: "music.mic")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.black)
                }
                
                    
                
                    
            }
            .navigationTitle(Text("Tol Journal"))
        }
        
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
