import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <MainApp />
    </div>
  );
}

class MainApp extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
    this.state = { registered: false };
  }
  render() {
    if (this.state.registered) {
      return (
        <div>
          <Confirmation data={this.state.data}/>
        </div>
      )
    } else {
      return (
        <div>
          <SignUpForm onSubmit={(data) => this.handleSubmit(data)}/>
          </div>
      )
    }
  }
  handleSubmit(data) {
    // This is where registration could happen with a real API.
    this.setState({registered: true, "data": data});
  }
}

class SignUpForm extends React.Component {
  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleInputChange = this.handleInputChange.bind(this);
  }
  render() {
    return (
      <div>
      <h2>Let's</h2>
      <h1>Sign Up</h1>
      <p>Use the form below to sign up for this super awesome service. You're onl a few steps away!</p>
      <form onSubmit={this.handleSubmit}>
        <input type="text" id="firstName" name="firstName" required placeholder="First Name" onChange={this.handleInputChange}></input>
        <input type="email" id="email" name="email" required placeholder="Email" onChange={this.handleInputChange}></input>
        <input type="password" id="password" name="password" required placeholder="Password" onChange={this.handleInputChange}></input>
        <button>Sign Up</button>
      </form>
      </div>
    )
  }
  handleSubmit(e) {
    e.preventDefault();
    this.props.onSubmit(this.state);
  }
  handleInputChange(event) {
    const target = event.target;
    const value = target.value;
    const name = target.name;

    this.setState({
      [name]: value
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
      <div>
      <h2>Welcome,</h2>
      <h1>{this.props.data.firstName}!</h1>
      <p>You have been registered for this awesome service. Please check your email listed below for instructions.</p>
      <h3>{this.props.data.email}</h3>
      <form onSubmit={this.handleSubmit}>
        <button>Sign In</button>
      </form>
      </div>
    )
  }
  handleSubmit(e) {
    alert("Not yet implemented.");
  }
}

export default App;
