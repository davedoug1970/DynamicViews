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
            let newButtonWidth = Double.random(in: 20...100)
            let positionXOffset = (geometry.size.width/2 * -1.0) + (newButtonWidth/2)
            let position = CGPoint(x: myView.position.x + positionXOffset, y: myView.position.y)
            
            ButtonView(location: position, buttonWidth: newButtonWidth, buttonColor: Color.random, name: myView.name, removeFunc: removeFromViews)
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
