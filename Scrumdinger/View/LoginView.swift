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
                case .success(let authResults):
                    print("Auth success")
                case .failure(let error):
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
