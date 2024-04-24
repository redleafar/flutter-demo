class Comments {
  final List<Comment> _Comments = [
    Comment(
      '1',
      'https://featuredanimation.com/wp-content/uploads/2022/02/Mickey-Mouse-Disney-Plus-Icon.jpg.webp',
      'Mickey',
      '',
      'test2',
      'https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/1600/900/75/dam/wdpro-assets/gallery/attractions/epcot/spaceship-earth/spaceship-earth-gallery00.jpg?1661270254143',
      100,
      20,
      50,
    ),
    Comment(
      '2',
      'https://featuredanimation.com/wp-content/uploads/2022/02/Simba-Disney-Plus-Icon.jpg.webp',
      //'https://static.wikia.nocookie.net/house-of-mouse/images/9/95/Simba.png/revision/latest?cb=20140502161207&path-prefix=es',
      'Simba',
      '',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
      '',
      100,
      20,
      50,
    ),
    Comment(
      '3',
      'https://featuredanimation.com/wp-content/uploads/2022/02/Grogu-Disney-Plus-Icon.jpg.webp',
      'Joda',
      '',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
      'https://destinosahora.com/wp-content/uploads/2023/02/disneyparksjetadventure-1280x720.jpg',
      60,
      78,
      20,
    ),
    Comment(
      '4',
      'https://featuredanimation.com/wp-content/uploads/2022/02/Ariel-Disney-Plus-Icon.jpg.webp',
      'Ariel',
      '',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
      '',
      9,
      20,
      50,
    ),
    Comment(
      '5',
      'https://featuredanimation.com/wp-content/uploads/2022/02/Perry-Disney-Plus-Icon.jpg.webp',
      'Perry',
      '',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
      '',
      100,
      20,
      50,
    ),
    Comment(
      '6',
      'https://featuredanimation.com/wp-content/uploads/2022/02/Chip-Disney-Plus-Icon.jpg.webp',
      'Chip',
      '',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
      'https://images.thedirect.com/media/article_full/disney-parks.jpg?imgeng=cmpr_75/',
      100,
      20,
      50,
    ),
  ];

  Comments();

  List<Comment> get comments => _Comments;
}

class Comment {
  String _id, _userThumb, _userName, _userMName, _commentText, _commentImage;
  int _reCommentCount, _commentCount, _loveCount;

  /*_Comment(this._userThumb, this._userName, this._userMName, this._CommentText,
      this._CommentImage, this._reCommentCount, this._commentCount,
      this._loveCount);*/

  Comment(
      this._id,
      this._userThumb,
      this._userName,
      this._userMName,
      this._commentText,
      this._commentImage,
      this._reCommentCount,
      this._commentCount,
      this._loveCount);

  get id => _id;
  
  get loveCount => _loveCount;

  get commentCount => _commentCount;

  get reCommentCount => _reCommentCount;

  get commentImage => _commentImage;

  get commentText => _commentText;

  get userMName => _userMName;

  get userName => _userName;

  String get userThumb => _userThumb;
}
