//
//  String+.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 26.02.2024.
//

import Foundation

extension String {
    func getYear() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        if let date = dateFormatter.date(from: self) {
            let year = Calendar.current.component(.year, from: date)
            return String(year)
        } else {
            return nil
        }
    }
}
