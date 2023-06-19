//
//  Supplement.swift
//  SupplementApp
//
//  Created by khloud on 21/11/1444 AH.
//

import SwiftUI
import FirebaseFirestore

struct SupplementView: View {
    @ObservedObject private var viewModel = SupplementViewModel()
    
    var body: some View {
        NavigationStack{
         
                List(viewModel.supplements ){ supplement in
                    VStack{
                        Text(supplement.supplementName )
                        Text(supplement.servingSize )
                        Text(supplement.weekDay )
                        
                    }
                
                
                
            }.onAppear(){
                self.viewModel.getData()
                
            }
            
        }
    }
    
    
}
 
struct SupplementView_Previews: PreviewProvider {
    static var previews: some View {
        SupplementView()
    }
}


