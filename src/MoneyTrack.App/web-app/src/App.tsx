import React, { lazy, Suspense } from 'react';
import 'bootstrap/dist/css/bootstrap.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
// import { Container } from 'react-bootstrap';
import './App.css';

const Home = lazy(() => import("./components/Home"));
const Navigation = lazy(() => import("./components/Navigation"));
const ProductTypeList = lazy(() => import("./components/Product/Type/ProductTypeList"));
const ProductList = lazy(() => import("./components/Product/ProductList"));
const UserList = lazy(() => import("./components/Users/UserList"));
const ExpencePlaceList = lazy(() => import("./components/Expence/Place/ExpencePlaceList"));
const OrderListList = lazy(() => import("./components/Orders/OrderList"));

const App: React.FC = () => (
  <Suspense fallback={<div>Loading...</div>}>
  <div>
    <Navigation />
    <Suspense fallback={<div>Loading...</div>}>
      <Router>
        <Routes>
              <Route path='/' element={<Home />} />
              <Route path='/product-types' element={<ProductTypeList />} />
              <Route path='/products' element={<ProductList />} />
              <Route path='/users' element={<UserList />} />
              <Route path='/expence-places' element={<ExpencePlaceList />} />
              <Route path='/orders' element={<OrderListList />} />
          </Routes>
      </Router> 
    </Suspense>
  </div>
  </Suspense>
);

export default App;

