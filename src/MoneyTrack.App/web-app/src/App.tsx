import React from 'react';
import 'bootstrap/dist/css/bootstrap.css';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
// import { Container } from 'react-bootstrap';
import './App.css';
import Home from './components/Home';
import Navigation from './components/Navigation';
import ProductTypeList from './components/Product/Type/ProductTypeList';
import ProductList from './components/Product/ProductList';
import UserList from './components/Users/UserList';
import ExpencePlaceList from './components/Expence/Place/ExpencePlaceList';
import OrderListList from './components/Orders/OrderList';

function App() {


  return (
   <div>
      <Navigation />

      <Router>
        <Switch>
              <Route exact path='/' component={Home} />
              <Route path='/product-types' component={ProductTypeList} />
              <Route path='/products' component={ProductList} />
              <Route path='/users' component={UserList} />
              <Route path='/expence-places' component={ExpencePlaceList} />
              <Route path='/orders' component={OrderListList} />
          </Switch>
      </Router> 
   </div>
  );
}

export default App;
