/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Dimensions
} from 'react-native';
var {height, width} = Dimensions.get('window');
const GoogleMapView = require('./GoogleMapView.js')

export default class Olgmaps extends Component {

  render() {
    const mapMarkers = [{lat: 55, lng:37}, {lat: 0, lng:0}, {lat: -41.2864, lng:174.7762}];
    return (
      <View style={styles.container}>
        <GoogleMapView style={styles.map}
                       showsUserLocation={true}
                       markers={mapMarkers}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 20,
  },
  map: {
    height: height - 30,
    marginBottom: 20,
    marginTop: 10,
    borderWidth: 1,
    borderColor: '#000000',
  },
});



AppRegistry.registerComponent('Olgmaps', () => Olgmaps);
