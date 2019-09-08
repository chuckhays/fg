/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Fragment} from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  TextInput,
  Button,
} from 'react-native';

import {
  Colors,
} from 'react-native/Libraries/NewAppScreen';

const App = () => {
  return (
    <Fragment>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <ScrollView
          contentInsetAdjustmentBehavior="automatic"
          style={styles.scrollView}>
          <MainApp />
        </ScrollView>
      </SafeAreaView>
    </Fragment>
  );
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});

class MainApp extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
    this.state = { registered: false, waiting: false };
  }
  render() {
    if (this.state.waiting) {
      return (
        <View>
          <Text>Waiting for API</Text>
        </View>
      )
    } else if (this.state.registered) {
      return (
        <View>
          <Confirmation data={this.state.data}/>
        </View>
      )
    } else {
      return (
        <View>
          <SignUpForm onSubmit={(data) => this.handleSubmit(data)}/>
          </View>
      )
    }
  }
  handleSubmit(data) {
    // This is where registration could happen with a real API.
    // Simulate a delay calling the async API.
    setTimeout(() => {this.setState({registered: true, waiting: false});}, 3000);
    this.setState({waiting: true, "data": data});
  }
}

class SignUpForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {firstName: "", email: "", password: ""};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.onChangeText = this.onChangeText.bind(this);
  }
  render() {
    let enabled = "firstName" in this.state && this.state.firstName.length > 0 &&
    "email" in this.state && this.state.email.length > 0 &&
    "password" in this.state && this.state.password.length > 0;
    let disabledValue = enabled ? "" : "diabled";
    return (
      <View>
        <Text>Let's</Text>
        <Text>Sign Up</Text>
        <Text>Use the form below to sign up for this super awesome service. You're only a few steps away!</Text>
        <TextInput placeholder="First Name" required={true} onChangeText={text => this.onChangeText("firstName", text)}/>
        <TextInput placeholder="Email" required={true} onChangeText={text => this.onChangeText("email", text)}/>
        <TextInput placeholder="Password" secureTextEntry={true} required={true} onChangeText={text => this.onChangeText("password", text)}/>
        <Button title="Sign Up" disabled={!enabled} onPress={() => this.handleSubmit()}/>
      </View>
    )
  }
  handleSubmit() {
    this.props.onSubmit(this.state);
  }
  onChangeText(name, text) {
    this.setState({
      [name]: text
    });
  }
}

class Confirmation extends React.Component {
  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  render() {
    return (
      <View>
        <Text>Welcome,</Text>
        <Text>{this.props.data.firstName}!</Text>
        <Text>You have been registered for this awesome service. Please check your email listed below for instructions.</Text>
        <Text>{this.props.data.email}</Text>
        <Button title="Sign In" />
      </View>
    )
  }
  handleSubmit(e) {
    alert("Not yet implemented.");
  }
}

export default App;
