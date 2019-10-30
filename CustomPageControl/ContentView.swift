//
//  ContentView.swift
//  CustomPageControl
//
//  Created by ramil on 30.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var Currentpage = 0
    var body: some View {
        VStack {
            ZStack {
                if Currentpage == 0 {
                    Image("img1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .cornerRadius(20)
                        .padding()
                } else if Currentpage == 1 {
                    Image("img2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .cornerRadius(20)
                        .padding()
                } else {
                    Image("img3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .cornerRadius(20)
                        .padding()
                }
            }
            pageControl(current: Currentpage)
            
            HStack {
                Button(action: {
                    if self.Currentpage < 3 {
                        self.Currentpage += 1
                    }
                }) {
                    Text("")
                }
                Button(action: {
                    if self.Currentpage != 0 {
                        self.Currentpage -= 1
                    }
                }) {
                    Text("Previous").padding(15)
                }.background(Color.orange)
                .cornerRadius(20)
                .foregroundColor(.white)
                
                Button(action: {
                    if self.Currentpage < 3 {
                        self.Currentpage += 1
                    }
                }) {
                    Text("Next").padding(15)
                }.background(Color.orange)
                .cornerRadius(20)
                .foregroundColor(.white)
            }
        }.animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct pageControl: UIViewRepresentable {
    
    var current = 0
    
    func makeUIView(context: UIViewRepresentableContext<pageControl>) -> UIPageControl {
        let page = UIPageControl()
        page.currentPageIndicatorTintColor = .black
        page.numberOfPages = 3
        page.pageIndicatorTintColor = .gray
        return page
    }
    
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<pageControl>) {
        uiView.currentPage = current
    }
}
