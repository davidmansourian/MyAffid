//
//  CustomHorizontalPickerView.swift
//  Affid
//
//  Created by David on 2022-11-23.
//

import SwiftUI

struct CustomHorizontalPickerView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomHorizontalPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomHorizontalPickerView()
    }
}

struct customSlider<Content: View> : UIViewRepresentable{
    
    @Binding var offset: CGFloat
    
    var content: Content
    
    init(offset: Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content){
        self.content = content()
        self._offset = offset
    }
    
    func makeUIView(context: Context) -> UIScrollView{
        
        let scrollView = UIScrollView()
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    
}
