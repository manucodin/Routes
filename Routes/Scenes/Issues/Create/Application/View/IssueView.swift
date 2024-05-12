//
//  IssueView.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI

struct IssueView: View {
    @StateObject var issueVM = IssueViewModel()
    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading) {
                    Text("issue_title")
                        .fontWeight(.bold)
                    Text("issue_message")
                        .font(.caption)
                    LabeledContent(content: {
                        CustomRoundedTextField(text: String(localized: "name (required)"), value: $issueVM.issue.name)
                    }, label: {
                        HStack {
                            Image(systemName: "list.bullet.clipboard")
                            Text("name")
                        }
                    })
                    LabeledContent(content: {
                        CustomRoundedTextField(text: String(localized: "surname (required)"), value: $issueVM.issue.surname)
                    }, label: {
                        HStack {
                            Image(systemName: "list.bullet.clipboard")
                            Text("surname")
                        }
                    })
                    LabeledContent(content: {
                        CustomRoundedTextField(text: String(localized: "email (required )"), value: $issueVM.issue.email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                    }, label: {
                        HStack {
                            Image(systemName: "list.bullet.clipboard")
                            Text("email")
                        }
                    })
                    LabeledContent(content: {
                        CustomRoundedTextField(text: String(localized: "phone"), value: $issueVM.issue.phone)
                            .keyboardType(.phonePad)
                    }, label: {
                        HStack {
                            Image(systemName: "list.bullet.clipboard")
                            Text("phone")
                        }
                    })
                    LabeledContent(content: {
                        DatePicker("", selection: $issueVM.issue.date)
                    }, label: {
                        HStack {
                            Image(systemName: "calendar")
                            Text("date")
                        }
                    })
                }
            }
            Section {
                VStack (alignment: .leading) {
                    Text("issue_description").fontWeight(.bold)
                    TextField("issue_description", text: $issueVM.issue.message, axis: .vertical)
                        .textArea()
                }
            }
        }
        .navigationTitle("createIssue")
        .navigationBarTitleDisplayMode(.inline)
        .listSectionSpacing(12)
        .padding(.horizontal, -10)
        .padding(.top, -22)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("send") {
                    issueVM.sendIssue()
                }.disabled(issueVM.requiredFieldsCompleted == false)
            }
        })
        .alert(issueVM.message, isPresented: $issueVM.showAlert) {
            Button("accept", role: .cancel) {}
        }
    }
}

#Preview {
    IssueView()
}
