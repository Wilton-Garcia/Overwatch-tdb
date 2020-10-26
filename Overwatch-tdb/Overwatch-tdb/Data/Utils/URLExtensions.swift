//
//  File.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 21/10/20.
//

import Foundation

extension URLResponse{
    func getStatusCode() -> Int? {
          if let httpResponse = self as? HTTPURLResponse {
              return httpResponse.statusCode
          }
          return nil
      }
}
