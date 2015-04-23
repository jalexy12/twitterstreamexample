var App = React.createClass({
  getInitialState: function() {
    return {tweets: []};
  },
  componentWillMount: function(){
    this.getTweets();
  },
  handleTweets: function(newTweets){
    this.setState({
      tweets: newTweets
    })
  },
  getTweets: function(){
    $.get('http://localhost:3000/index.json', this.handleTweets)
  },
  render: function() {
    setInterval(this.getTweets, 9000)
    console.log(this.state.tweets)
    var tweets = this.state.tweets.map(function(tweet){
      return <div className="row col-sm-12 singletweet"><b> {tweet} </b><br /></div>
    })
    return (<div>
      <div>{tweets} </div>
      </div>)
  }
});
