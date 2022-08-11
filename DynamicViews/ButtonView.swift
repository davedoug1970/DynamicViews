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
  
    var body: some View {
      Circle()
        .fill(ButtonColor)
        .position(Location)
        .offset(x: (OffsetWidth/2 * -1) + (ButtonWidth/2) , y:0)
        .frame(width: ButtonWidth)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
      ButtonView(Location: CGPoint(x: 50, y: 50), OffsetWidth: 100, ButtonWidth: 60, ButtonColor: .blue)
    }
}
