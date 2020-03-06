//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct CustomTabBar: View {
    @State private var currentView: Tab = .Tab1
    @State private var showModal: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                if self.currentView == .Tab1 {
                    Screen1()
                }
                if self.currentView == .Tab2 {
                    Screen2()
                }
                HStack {
                    TabBarItem(currentView: self.$currentView, imageName: "list.bullet", paddingEdges: .leading, tab: .Tab1)
                    Spacer()
                    ShowModalTabBarItem(radius: 55) {
                        self.showModal.toggle()
                    }
                    Spacer()
                    TabBarItem(currentView: self.$currentView, imageName: "gear", paddingEdges: .trailing, tab: .Tab2)
                }
                .frame(minHeight: 70)
                .background(Color(.white))
            }
        }
        .background(Color(.white))
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: self.$showModal) { ScreenModal() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
