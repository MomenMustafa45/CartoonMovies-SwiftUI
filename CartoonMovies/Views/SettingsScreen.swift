import SwiftUI

struct SettingsScreen: View {
    @StateObject private var themeManager = ThemeManager()

    @State private var settingsVM = SettingsViewModel()

    var body: some View {
        NavigationView {
            Form {

                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $settingsVM.isDarkMode)
                  
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
