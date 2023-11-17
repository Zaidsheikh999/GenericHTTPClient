//
//  ContentView.swift
//  GenericHTTPClient
//
//  Created by Zaid on 17/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        ZStack{
            if vm.isData{
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading,spacing: 20){
                        ForEach(vm.booksComingSoon, id: \.id){ item in
                            Item(item: item)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.leading,15)
                }
            }else{
                ProgressView()
            }
        }
        .onAppear(){
            Task{
                await vm.httpRequest()
            }
        }
    }
    
}





struct Item: View {
    
    var item: BooksComingSoon
    
    var body: some View {
        HStack(spacing: 15){
            if let url = URL(string: item.formats["image/jpeg"] ?? "") {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    
                } placeholder: {
                    ProgressView()
                }
            } else {
                Text("Invalid URL")
            }
            
            Text(item.title.prefix(25))
            
            Spacer()
        }
    }
}
