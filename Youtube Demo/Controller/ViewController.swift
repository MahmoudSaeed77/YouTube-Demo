//
//  ViewController.swift
//  Youtube Demo
//
//  Created by Mohamed Ibrahem on 3/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import Kingfisher

class ViewController: UIViewController {
    // Mark: - Properities.
    let homeView = HomeView()
    struct Constants {
        static let homeCellId = "homeCellId"
        static var apiKey = "AIzaSyB43vfEpUD3NFH5ZV3l1UXcJOZ5aZ7SIZQ"
    }
    var viewModel: ViewModel!
    var dataArray = [Snippet]()
    var videoArray = [Item]()
    
    enum channelId: CustomStringConvertible {
        case first, second, third, fourth, fifth
        var description: String {
            switch self {
            case .first:
                return "UCfhW84xfA6gEc4hDK90rR1Q"
            case .second:
                return "UCOpcACMWblDls9Z6GERVi1A"
            case .third:
                return "UCY04Nk2nZkUkT4hqf_7suZA"
            case .fourth:
                return "UCCODtTcd5M1JavPCOr_Uydg"
            case .fifth:
                return "UC3KEoMzNz8eYnwBC34RaKCQ"
            }
        }
    }
    
    enum videoId: CustomStringConvertible{
        case first, second, third, fourth, fifth
        var description: String {
            switch self {
                
            case .first:
                return "Yq7hx6jSTtE"
            case .second:
                return "O7dq_wo5eto"
            case .third:
                return "806Ag9U0EZc"
            case .fourth:
                return "27U0O3Eeo1I"
            case .fifth:
                return "R35gWBtLCYg"
            }
        }
    }
    
    fileprivate func createUrl(with channel: channelId) -> String {
        return "https://www.googleapis.com/youtube/v3/channels?part=snippet&id=\(channel.description)&key=" + Constants.apiKey
    }
    fileprivate func createVideoUrl(with video: videoId) -> String {
        return "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=\(video.description)&key=" + Constants.apiKey
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
        navigationConfiguration()
        collectionViewConfiguration()
        print(createUrl(with: .second))
        print(createVideoUrl(with: .second))
    }
    fileprivate func setupView() {
        view = homeView
    }
    fileprivate func navigationConfiguration() {
        let img = UIBarButtonItem(customView: homeView.logoImage)
        let lbl = UIBarButtonItem(customView: homeView.titleLabel)
        navigationItem.leftBarButtonItems = [img, lbl]
    }
    
    fileprivate func collectionViewConfiguration() {
        let collection = homeView.collectionView
        collection.delegate = self
        collection.dataSource = self
        collection.register(HomeCell.self, forCellWithReuseIdentifier: Constants.homeCellId)
    }
    fileprivate func addItem(index: IndexPath) {
        switch index.item {
        case 0:
            doRequest(id: .first)
        case 1:
            doRequest(id: .second)
        case 2:
            doRequest(id: .third)
        case 3:
            doRequest(id: .fourth)
        case 4:
            doRequest(id: .fifth)
        default:
            doRequest(id: .first)
        }
    }
    fileprivate func addVideo(index: IndexPath) {
        switch index.item {
        case 0:
            doVideoRequest(id: .first)
        case 1:
            doVideoRequest(id: .second)
        case 2:
            doVideoRequest(id: .third)
        case 3:
            doVideoRequest(id: .fourth)
        case 4:
            doVideoRequest(id: .fifth)
        default:
            doVideoRequest(id: .first)
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 350)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.homeCellId, for: indexPath) as! HomeCell
        
        cell.playerView.load(withVideoId: videoId.fifth.description)
        addItem(index: indexPath)
        addVideo(index: indexPath)
        let arrData = dataArray[indexPath.item]
        let vidData = videoArray[indexPath.item]
        DispatchQueue.main.async {
            cell.playerView.load(withVideoId: vidData.id ?? "")
            cell.channelNameLabel.text = arrData.title
            cell.channelThumb.kf.setImage(with: (arrData.thumbnails?.high as! Resource))
        }
        return cell
    }
}
extension ViewController {
    fileprivate func doRequest(id: channelId) {
        let url = URL(string: createUrl(with: id))
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                guard let data = data else {
                    print("data error")
                    return
                }
                do{
                    let json = try JSONDecoder().decode(Snippet.self, from: data)
                    print(json.title ?? "", json.thumbnails?.medium?.url ?? "")
                    DispatchQueue.main.async {
                        self.dataArray.append(json)
                        self.homeView.collectionView.reloadData()
                    }
                } catch let err {
                    print(err.localizedDescription)
                }
            } else {
                print(error as Any)
            }
        }
        task.resume()
    }
    fileprivate func doVideoRequest(id: videoId) {
        let url = URL(string: createVideoUrl(with: id))
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                guard let data = data else {
                    print("data error")
                    return
                }
                do{
                    let json = try JSONDecoder().decode(Item.self, from: data)
                    print(json.id ?? "")
                    DispatchQueue.main.async {
                        self.videoArray.append(json)
                        self.homeView.collectionView.reloadData()
                    }
                } catch let err {
                    print(err.localizedDescription)
                }
            } else {
                print(error as Any)
            }
        }
        task.resume()
    }
}
