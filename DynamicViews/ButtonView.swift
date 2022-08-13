//
//  ButtonView.swift
//  DynamicViews
//
//  Created by David Douglas on 8/11/22.
//

import SwiftUI

struct ButtonView: View {
  @State var location: CGPoint
  @State var buttonWidth: Double
  @State var buttonColor: Color
  @State var name: String
  @State var removeFunc: (String) -> Void
  @State private var isAnimating: Bool = false
  @State private var newLocation: CGPoint = .zero
  
  var body: some View {
    ZStack {
      Circle()
        .fill(buttonColor)
        .position(x: location.x, y: location.y)
        .frame(width: isAnimating ? buttonWidth + 10 : buttonWidth)
        .opacity(isAnimating ? 0 : 1)
        .animation(.easeOut(duration: 0.2), value: isAnimating)
        .gesture(
          DragGesture()
            .onChanged { gesture in
              if (newLocation == .zero)
              {
                newLocation = location
              }
              
              location = CGPoint(x: gesture.translation.width + newLocation.x,
                                 y: gesture.translation.height + newLocation.y)
            }
            .onEnded { gesture in
              location = CGPoint(x: gesture.translation.width + newLocation.x,
                                 y: gesture.translation.height + newLocation.y)
              newLocation = location
            }
        ) //: DRAG GESTURE
        .gesture(
          TapGesture()
            .onEnded { _ in
              isAnimating = true
              DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                removeFunc(name)
              }
            }
        ) //: TAP GESTURE
    }
  }
}

struct ButtonView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonView(location: CGPoint(x: 50, y: 50), buttonWidth: 60, buttonColor: .blue, name: "test", removeFunc: { (name: String) -> Void in print(name) })
  }
}
