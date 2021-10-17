//
//  Artwork.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 10/5/21.
//

import Foundation
import MapKit

class Artwork: NSObject, MKAnnotation {
  let title: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.coordinate = coordinate
    super.init()
  }

}
