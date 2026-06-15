import SwiftUI

struct SettingsScreen: View {
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    
    @StateObject private var themeManager = ThemeManager()
    @State private var settingsVM = SettingsViewModel()

    var body: some View {
        NavigationView {
            Form {

                Section("Appearance") {
                    Picker("", selection: $appTheme){
                        ForEach(AppTheme.allCases, id:\.rawValue){ theme in
                            
                            Text(theme.rawValue)
                                .tag(theme)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("Override system appearance to always use light mode")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
      

                Section("Account") {
                    TextField("Username", text: $settingsVM.username)
                        .disabled(true)
                }

                Section("Preferences") {
                    Stepper(
                        "Items per page: \(settingsVM.itemsPerPage)",
                        value: $settingsVM.itemsPerPage,
                        in: 10...60,
                        step: 5
                    )

                    Toggle(
                        "Enable notifications",
                        isOn: $settingsVM.notificationEnabled
                    )
                }

                Section {
                    Button("Reset Settings") {
                        settingsVM.isDarkMode = false
                        settingsVM.itemsPerPage = 20
                        settingsVM.notificationEnabled = false
                    }
                    .foregroundStyle(.red)
                    .fontWeight(.semibold)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsScreen()
}
