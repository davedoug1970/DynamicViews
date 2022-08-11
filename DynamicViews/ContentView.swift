//
//  ContentView.swift
//  DynamicViews
//
//  Created by David Douglas on 8/10/22.
//

import SwiftUI

struct ContentView: View {
  private struct myObject: Identifiable {
    let name: String
    let position: CGPoint
    var id: String { name }
  }
  
  @State private var myViews: [myObject] = []
  
  var body: some View {
    VStack {
      GeometryReader { geometry in
        ZStack {
          Rectangle()
            .fill(.white.opacity(0.01))
          
          ForEach(myViews) { myView in
            ButtonView(Location: myView.position, OffsetWidth: geometry.size.width, ButtonWidth: .random(in: 20...100), ButtonColor: Color.random)
          }
        }
        .gesture(
          DragGesture(minimumDistance: 0).onEnded({ (value) in
            myViews.append(myObject(name:randomString(length: 8), position: value.location))
          })
        )
      }
    }
  }
  
  func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
