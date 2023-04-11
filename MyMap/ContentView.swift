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
//    マップ種類　最初は標準から
    @State var displayMapType: MapType = .standard
    
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
            
//            奥から手前方向にレイアウト（右下基準で配置する）
            ZStack(alignment: .bottomTrailing){
                //マップを表示
                MapView(searchKey: displaySearchKey,mapType: displayMapType)
                
//                マップ種類切り替えボタン
                Button{
//                    標準　→ 衛生写真　→ 衛生写真＋交通機関ラベル
                    if displayMapType == .standard{
                        displayMapType = .satellite
                    }else if displayMapType == .satellite{
                        displayMapType = .hybrid
                    }else {
                        displayMapType = .standard
                    }
                } label: {
                    //マップアイコンの表示
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }//Buttomここまで
                //右の余白を２０空ける
                .padding(.trailing,20.0)
                //下の余白を３０空ける
                .padding(.bottom,30.0)
            }//ZStackここまで
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
