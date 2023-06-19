//
//  Model.swift
//  SupplementApp
//
//  Created by khloud on 21/11/1444 AH.
//

import Foundation
import FirebaseFirestore

import SwiftUI

struct Supplements: Identifiable {
  var id: String?
  var supplementName: String
  var servingSize: String
  var weekDay: String
}



