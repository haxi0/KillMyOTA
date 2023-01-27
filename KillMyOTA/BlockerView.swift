//
//  BlockerView.swift
//  KillMyOTA
//
//  Created by Анохин Юрий on 27.01.2023.
//

import SwiftUI

struct BlockerView: View {
    @AppStorage("statusOTA") private var statusOTA = true
    @State private var disabledAfterApply = false
    @State private var output = "Unknown state"
    
    var body: some View {
        Spacer()
        
        VStack {
            Image("KillMyOTA")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(25)
            Text("KillMyOTA")
                .font(.system(size: 36, weight: .bold))
        }
        
        Spacer()
        
        VStack {
            if #available(iOS 16.2, *) {
                Button {}
            label: {
                Text("iOS version not supported!")
            }
            .disabled(true)
            .buttonStyle(CustomButtonStyle())
            } else {
                Button {
                    if FileManager.default.fileExists(atPath: "/var/mobile/Library/Preferences/com.apple.MobileAsset.plist") {
                        enableOTA()
                        disabledAfterApply = true
                        output = "Enabled OTA, reboot to see the changes"
                    } else {
                        disableOTA()
                        disabledAfterApply = true
                        output = "Disabled OTA, reboot to see the changes"
                    }
                } label: {
                    Text(output)
                }
                .disabled(disabledAfterApply)
                .buttonStyle(CustomButtonStyle())
            }
        }
        .onAppear {
            grant_full_disk_access() { error in
                print(error?.localizedDescription as Any)
            }
            if FileManager.default.fileExists(atPath: "/var/mobile/Library/Preferences/com.apple.MobileAsset.plist") {
                output = "OTA will be enabled"
            } else {
                output = "OTA will be disabled"
            }
        }
    }
}

struct BlockerView_Previews: PreviewProvider {
    static var previews: some View {
        BlockerView()
    }
}
