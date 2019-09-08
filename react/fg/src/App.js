import React from 'react';
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
    this.state = { registered: false, waiting: false };
  }
  render() {
    if (this.state.waiting) {
      return (
        <div>
          <Spinner />
        </div>
      )
    } else if (this.state.registered) {
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
    // Simulate a delay calling the async API.
    setTimeout(() => {this.setState({registered: true, waiting: false});}, 3000);
    this.setState({waiting: true, "data": data});
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
      <p className="heading1">Let's</p>
      <p className="heading2">Sign Up</p>
      <p className="help">Use the form below to sign up for this super awesome service. You're only a few steps away!</p>
      <form className="appForm" onSubmit={this.handleSubmit}>
        <div>
        <input type="text" id="firstName" name="firstName" required placeholder="First Name" onChange={this.handleInputChange}></input>
        </div>
        <div>
        <input type="email" id="email" name="email" required placeholder="Email" onChange={this.handleInputChange}></input>
        </div>
        <div>
        <input type="password" id="password" name="password" required placeholder="Password" onChange={this.handleInputChange}></input>
        </div>
        <div>
        <button>Sign Up</button>
        </div>
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
      <p className="heading1">Welcome,</p>
      <p className="heading2">{this.props.data.firstName}!</p>
      <p class="help">You have been registered for this awesome service. Please check your email listed below for instructions.</p>
      <p className="heading3">{this.props.data.email}</p>
      <form className="appForm" onSubmit={this.handleSubmit}>
        <button>Sign In</button>
      </form>
      </div>
    )
  }
  handleSubmit(e) {
    alert("Not yet implemented.");
  }
}

class Spinner extends React.Component {
  render() {
    return (
      <div className="spinner">
        <div className="double-bounce1"></div>
        <div className="double-bounce2"></div>
      </div>
    )
  }
}

export default App;
