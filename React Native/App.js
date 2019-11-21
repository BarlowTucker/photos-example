import React, { Component } from 'react';
import { loadImageList } from './core/Unslash';
import { Image, FlatList } from 'react-native';

const PhotoItem = ({url}) => {
  return <Image source={{uri: url}} style={{width: '100%', height: 250 }} />
}

const PhotoList = ({photos}) => {
  return <FlatList data={photos} renderItem={({item}) => <PhotoItem url={item.urls.small} /> } />
}

class App extends Component {
  state = { photos: [] }

  componentDidMount = () => {
    loadImageList().then(json => {
      this.setState({photos: json})
    })
  }

  render() {
    return <PhotoList photos={this.state.photos} />
  }
};

export default App;
