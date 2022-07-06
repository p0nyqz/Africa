//
//  VideoListView.swift
//  Africa
//
//  Created by p0nyqz on 02.06.2022.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    
    var videos: [Video] = Bundle.main.decode("video.json")
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                } //: LOOP
            } //: LIST
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
