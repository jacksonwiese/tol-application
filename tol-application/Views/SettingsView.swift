//
//  SettingsView.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/13/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                Form {
                    Section(header: Text("Stats")) {
                        VStack{
                            HStack{
                                VStack{
                                    Text("15")
                                    Text("Days Streak")
                                }
                                Spacer()
                                VStack{
                                    Text("98")
                                    Text("Total Entries")
                                }
                            }
                            HStack {
                                VStack{
                                    Text("325")
                                    Text("Total Minutes")
                                }
                                Spacer()
                                VStack{
                                    Text("106.7")
                                    Text("Avg. Word Count")
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Account")) {
                        Text("Account")
                        Text("Data")
                        Text("Sync")
                    }
                    Section(header: Text("Calendar")) {
                        Text("Calendar")
                        Text("Appearance")
                    }
                    
                    Section(header: Text("Other")) {
                        Text("Passcode")
                        Text("Reminders")
                        Text("Advanced")
                        Text("Help")
                        Text("About")
                    }
                }
            }
            .navigationTitle("Settings")
            
            
        }//end of Form
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
