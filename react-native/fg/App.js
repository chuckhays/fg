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
  Alert,
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
    margin: 20,
    backgroundColor: Colors.white,
  },
  body: {
    backgroundColor: Colors.white,
  },
  heading1Text: {
    fontSize: 20,
  },
  heading2Text: {
    fontSize: 24,
    fontWeight: '600',
  },
  helpText: {
    color: Colors.dark,
  },
  emailText: {
    fontWeight: '600',
  },
  input: {
    marginVertical: 10,
    marginHorizontal: 0,
    borderWidth: 1,
    padding: 5,
  },
  submit: {
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
        <Text style={styles.heading1Text}>Let's</Text>
        <Text style={styles.heading2Text}>Sign Up</Text>
        <Text style={styles.helpText}>Use the form below to sign up for this super awesome service. You're only a few steps away!</Text>
        <TextInput style={styles.input} placeholder="First Name" required={true} onChangeText={text => this.onChangeText("firstName", text)}/>
        <TextInput style={styles.input} placeholder="Email" required={true} onChangeText={text => this.onChangeText("email", text)}/>
        <TextInput style={styles.input} placeholder="Password" secureTextEntry={true} required={true} onChangeText={text => this.onChangeText("password", text)}/>
        <Button style={styles.submit} title="Sign Up" disabled={!enabled} onPress={() => this.handleSubmit()}/>
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
        <Text style={styles.heading1Text}>Welcome,</Text>
        <Text style={styles.heading2Text}>{this.props.data.firstName}!</Text>
        <Text style={styles.helpText}>You have been registered for this awesome service. Please check your email listed below for instructions.</Text>
        <Text style={styles.emailText}>{this.props.data.email}</Text>
        <Button style={styles.submit} title="Sign In" onPress={() => this.handleSubmit()}/>
      </View>
    )
  }
  handleSubmit(e) {
    Alert.alert(
      'Oops',
      'Not yet implemented',
      [
        {text: 'OK', onPress: () => console.log('OK Pressed')},
      ],
      {cancelable: false},
    );
  }
}

export default App;
