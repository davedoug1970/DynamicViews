//
//  ButtonView.swift
//  DynamicViews
//
//  Created by David Douglas on 8/11/22.
//

import SwiftUI

struct ButtonView: View {
  @State var Location: CGPoint
  @State var OffsetWidth: Double
  @State var ButtonWidth: Double
  @State var ButtonColor: Color
  @State var Name: String
  @State var RemoveFunc: (String) -> Void
  @State var DragOffset: CGSize = .zero
  @State var NewDragOffset: CGSize = .zero
  
    var body: some View {
      Circle()
        .fill(ButtonColor)
        .position(Location)
        .offset(x: (OffsetWidth/2 * -1) + (ButtonWidth/2) , y:0)
        .frame(width: ButtonWidth)
        .offset(x: self.DragOffset.width, y: self.DragOffset.height)
        .gesture(
          DragGesture()
            .onChanged { gesture in
              self.DragOffset = CGSize(width: gesture.translation.width + self.NewDragOffset.width, height: gesture.translation.height + self.NewDragOffset.height)
            }
            .onEnded { gesture in
              self.DragOffset = CGSize(width: gesture.translation.width + self.NewDragOffset.width, height: gesture.translation.height + self.NewDragOffset.height)
              self.NewDragOffset = self.DragOffset
            }
        ) //: DRAG GESTURE
        .gesture(
          TapGesture()
            .onEnded { _ in
              RemoveFunc(Name)
            }
        ) //: TAP GESTURE
    }
}



struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
      ButtonView(Location: CGPoint(x: 50, y: 50), OffsetWidth: 100, ButtonWidth: 60, ButtonColor: .blue, Name: "test", RemoveFunc: { (name: String) -> Void in print(name) })
    }
}
