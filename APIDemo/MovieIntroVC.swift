//
//  MovieIntroVC.swift
//  MovieSelection
//
//  Created by 李易潤 on 2021/3/3.
//

import UIKit

class MovieIntroVC: UIViewController {
    
    

    @IBOutlet weak var movieOverviewTextView: UITextView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var tmbdVoteLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
 
    @IBOutlet weak var movieImage: UIImageView!
    
    var movieName: String?
    var releaseDate: String?
    var tmbdVote: Double?
    var movieOverview: String?
    var backdrop_path: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieNameLabel.text = movieName
        releaseDateLabel.text = releaseDate
        if let tmbdVote = tmbdVote{
            tmbdVoteLabel.text = "\(tmbdVote)"
        }
        movieOverviewTextView.text = movieOverview
        if let imageAddress = backdrop_path{
            if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/" + imageAddress){
                let task = URLSession.shared.dataTask(with: imageURL){(data, response, error ) in
                    if let data = data{
                        DispatchQueue.main.async {
                            self.movieImage.image = UIImage(data:data)
                        }
                    }
                }
                task.resume()
            }
        }
        self.likeButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        self.likeButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .selected)
        likeButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 40), forImageIn: .normal)

    }
    
    @IBAction func likeButton(_ sender: UIButton) {
        if sender.isSelected {
                    self.likeButton.isSelected = false
            self.likeButton.tintColor = UIColor.black

                } else {
                    self.likeButton.isSelected = true
                    self.likeButton.tintColor = UIColor.systemRed

                }
    }
}
