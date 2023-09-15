import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = LocationViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Picker("Select a State", selection: $viewModel.selectedState) {
                    ForEach(viewModel.states, id: \.name) { state in
                        Text(state.name).tag(state as States?)
                    }
                }
                .pickerStyle(MenuPickerStyle())

                if let selectedState = viewModel.selectedState {
                    Picker("Select a City", selection: $viewModel.selectedCity) {
                        ForEach(selectedState.cities, id: \.self) { city in
                            Text(city).tag(city as String?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Spacer()
            }
            .navigationTitle("State & City Selector")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
