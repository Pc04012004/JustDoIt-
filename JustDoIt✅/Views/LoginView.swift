import SwiftUI

struct LoginView: View {
    @StateObject var viewmodel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Just Do It List", subtitle: "Get Things Done here", background: .pink)
                    .frame(width:150 , height: 240)
                    
                // Login form
                Form {
                    if !viewmodel.errormessage.isEmpty {
                        Text(viewmodel.errormessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewmodel.email)
                        .foregroundColor(.blue)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()

                    SecureField("Password", text: $viewmodel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()

                    TLButtonView(title: "Login", background: .blue) {
                        viewmodel.login()
                    }
                }

                // Spacer to push content up
                Spacer()

                // Create account section with increased padding
                VStack {
                    Text("New here?")
                        // Add padding here

                    NavigationLink("Let's create an account", destination: RegisterView())
                }
                .padding(.bottom, 20) // Add additional padding for spacing
            }
        }
    }
}

#Preview {
    LoginView()
}
