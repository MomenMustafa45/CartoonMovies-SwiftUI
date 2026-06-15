//
//  PersonView.swift
//  CartoonMovies
//
//  Created by mac user on 08/06/2026.
//

import SwiftUI

struct PersonView: View {
    var personViewModel = PersonViewModel(service: CartoonMoviesService())
    
    var body: some View {
        
        NavigationStack{
            switch personViewModel.state {
            case .idle:
                Text("There is no data yet!")
            case .loading:
                ProgressView()
            case .loaded(let person):
                Text(person.name)
            case .error(let errorString):
                Text(errorString)
            }
        }
        .task {
            await personViewModel.fetch(personUrl: "https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9")
        }
   
    }
}

#Preview {
    PersonView()
}
