//
//  LoginView.swift
//  Scrumdinger
//
//  Created by Agfi on 19/04/24.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State var name: String = ""
    @State var email: String = ""
    
    var body: some View {
        VStack {
            SignInWithAppleButton(onRequest: { request in
                request.requestedScopes = [.email, .fullName]
            }, onCompletion: { result in
                switch result {
                case .success(_):
                    print("Auth success")
                case .failure(_):
                    print("Auth Failed!")
                }
            })
            .frame(width: 250, height: 35)
        }
    }
}

#Preview {
    LoginView()
}
