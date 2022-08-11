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
            ButtonView(Location: myView.position, OffsetWidth: geometry.size.width, ButtonWidth: .random(in: 20...100), ButtonColor: Color.random, Name: myView.name, RemoveFunc: removeFromViews)
          }
        }
        .gesture(
          DragGesture(minimumDistance: 0).onEnded({ (value) in
            myViews.append(myObject(name:String.random(length: 8), position: value.location))
          })
        )
      }
    }
  }
  
  func removeFromViews(name: String) {
    myViews.remove(at: myViews.firstIndex(where: { $0.name == name })!)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
