import React, { Component } from 'react';
import { Navbar, Nav, Container} from 'react-bootstrap';


class Navigation extends Component {
    render() {
      return (
        <Navbar collapseOnSelect sticky='top' expand='sm' bg='light' variant='light'>
            <Container>
                <Navbar.Toggle aria-controls='responsive-navbar-nav' />
                <Navbar.Collapse id='responsive-navbar-nav'>
                    <Nav.Link href='/'>Home</Nav.Link>
                    <Nav.Link href='/product-types'>Product types</Nav.Link>
                    <Nav.Link href='/products'>Products</Nav.Link>
                    <Nav.Link href='/users'>Users</Nav.Link>
                    <Nav.Link href='/expence-places'>Expence places</Nav.Link>
                    <Nav.Link href='/orders'>Orders</Nav.Link>
                </Navbar.Collapse>
            </Container>
        </Navbar>
      );
    }
  }
  
  export default Navigation;