//
//  ContentView.swift
//  MyMap
//
//  Created by 藤川賢也 on 2023/03/09.
//

import SwiftUI

struct ContentView: View {
    
//    入力中の文字列を保持する状態
    @State var inputText: String = ""
//    検索キーワードを保持する状態変数
    @State var displaySearchKey: String = ""
    
    var body: some View {
        VStack{
//            テキストフィールド（文字入力）
            TextField("キーワード",text: $inputText, prompt: Text("キーワードを入力してください"))
            
//            入力が完了されたとき
                .onSubmit {
//                入力が完了したので検索キーワードに設定する
                displaySearchKey = inputText
            }
//            余白を追加
            .padding()
//            マップを表示
            MapView(searchKey: displaySearchKey)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
