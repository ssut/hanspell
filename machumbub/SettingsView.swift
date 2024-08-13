import SwiftUI
import LaunchAtLogin
import KeyboardShortcuts

extension KeyboardShortcuts.Name {
    static let togglePopover = Self("togglePopover", default: .init(.k, modifiers: [.command, .option]))
    static let checkSelection = Self("checkSelection", default: .init(.c, modifiers: [.command, .shift]))
    static let pasteAndCheck = Self("pasteAndCheck", default: .init(.v, modifiers: [.command, .shift]))
}

struct SettingsView: View {
    @StateObject var appState = AppState.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                HStack(alignment: .top) {
                    Text("마ㅈ춤법 검사기")
                        .font(.title)
                    Text("\(appState.appVersion ?? "")")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 4)
                }
                
                Spacer()
                
                Button(action: {
                    appState.checkForUpdate()
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.up.right.circle.fill")
                        Text("업데이트 확인")
                    }
                }
                .buttonStyle(LinkButtonStyle())
                .focusable(false)
            }
            .padding()
            
            SettingsDivider()
            
            VStack(alignment: .leading) {
                Grid(alignment: .leading) {
                    GridRow(alignment: .firstTextBaseline) {
                        Text("단축키:")
                            .gridColumnAlignment(.trailing)
                        
                        VStack(alignment: .leading) {
                            KeyboardShortcuts.Recorder("", name: .togglePopover)
                            
                            Text("")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                        }
                        .gridColumnAlignment(.leading)
                    }
                    
                    //                GridRow(alignment: .firstTextBaseline) {
                    //                    Text("자동 복사 단축키:")
                    //
                    //                    VStack(alignment: .leading) {
                    //                        KeyboardShortcuts.Recorder("", name: .checkSelection)
                    //
                    //                        Text("다른 앱 사용 중 선택한 텍스트를 자동으로 복사하여 검사하는 단축키를 지정합니다.")
                    //                            .font(.subheadline)
                    //                            .foregroundColor(.gray)
                    //                            .padding(.leading, 10)
                    //                    }
                    //                }
                    
                    GridRow(alignment: .firstTextBaseline) {
                        Text("붙여넣기 단축키:")
                        
                        VStack(alignment: .leading) {
                            KeyboardShortcuts.Recorder("", name: .pasteAndCheck)
                            
                            Text("클립보드에 있는 텍스트를 자동으로 붙여넣어 검사하는 단축키를 지정합니다.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                        }
                    }
                    
                    GridRow(alignment: .firstTextBaseline) {
                        Text("")
                        
                        VStack(alignment: .leading) {
                            LaunchAtLogin.Toggle {
                                Text("맥 시작 시 자동 실행") }
                            .padding(.leading, 10)
                        }
                    }
                }
            }
            .padding()
            
            SettingsDivider()
            
            VStack(alignment: .leading) {
                Text("Disclaimer:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.top, 2)
                Text("이 앱은 NAVER 맞춤법 검사기를 편하게 사용할 수 있도록 개발된 앱으로 NAVER의 공식 앱이 아닙니다.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 16) {
                    Link(destination: URL(string: "https://github.com/ssut/machumbub")!)
                    {
                        HStack {
                            Image(systemName: "link")
                                .font(.system(size: 14))
                                .foregroundColor(.blue)
                            Text("GitHub")
                        }
                    }
                    .foregroundColor(.accentColor)
                    .focusable(false)
                    
                    Link(destination: URL(string: "https://www.buymeacoffee.com/suhunhan95")!) {
                        HStack(spacing: 2) {
                            Image(systemName: "cup.and.saucer.fill")
                            Text("Buy Me A Coffee")
                        }
                    }
                    .foregroundColor(.accentColor)
                    .focusable(false)
                }
                .padding(.top, 4)
            }
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
