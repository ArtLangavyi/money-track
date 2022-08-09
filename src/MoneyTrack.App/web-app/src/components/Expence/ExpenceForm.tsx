import React, { useState, useEffect } from 'react';
import { connect, useDispatch } from 'react-redux';
import { Button, InputGroup, Form, Spinner, Dropdown } from 'react-bootstrap';
import { ProductResponse } from "../../clients/src/clients";
import { getProductList, getProductListLoading } from '../Product/selectors';
import { loadProductList } from '../Product/thunks';
import { addExpence } from './thunks';

const ExpenceForm = ({ orderId, productList, onCreatePressed, isLoadingProducts }
    : { orderId: number, productList:ProductResponse[], onCreatePressed:any, isLoadingProducts:any }) => {
    const [formData, setFormData] = useState({
        productId: 0,
        orderId: 0,
        price: 0.0,
        qantity: 0,
        amount: 0,
        discount: 0
      });

    const [selectedProduct, setSelectedProduct] = useState({ id: 0, name: 'Product' });

    const dispatch = useDispatch();
    useEffect(() => {
        dispatch(loadProductList() as any);
    }, []);
    

    return (
        <div>
            <InputGroup className="mb-3">
                <Form.Control
                name="name" 
                type="text"
                value={formData.price}
                placeholder="Price"
                aria-label="Price"
                aria-describedby="basic-addon2"
                onChange={e => setFormData({...formData, price: Number(e.target.value)})}
                required
                />
                <InputGroup className="mb-3">
                    <Form.Control
                        name="name" 
                        type="text"
                        value={formData.qantity}
                        placeholder="Qantity"
                        aria-label="Qantity"
                        aria-describedby="basic-addon2"
                        onChange={e => setFormData({...formData, qantity: Number(e.target.value)})}
                        required
                        />
                </InputGroup>
                <InputGroup className="mb-3">
                    <Form.Control
                        name="name" 
                        type="text"
                        value={formData.amount}
                        placeholder="Amount"
                        aria-label="Amount"
                        aria-describedby="basic-addon2"
                        onChange={e => setFormData({...formData, amount: Number(e.target.value)})}
                        required
                        />
                </InputGroup>
                <InputGroup className="mb-3">
                    <Form.Control
                        name="name" 
                        type="text"
                        value={formData.discount}
                        placeholder="Discount"
                        aria-label="Discount"
                        aria-describedby="basic-addon2"
                        onChange={e => setFormData({...formData, discount: Number(e.target.value)})}
                        required
                        />
                </InputGroup>
                <InputGroup className="mb-3">
                    <Dropdown>
                        <Dropdown.Toggle variant="success" id="dropdown-basic">
                            {selectedProduct.name as string}
                        </Dropdown.Toggle>
                        <Dropdown.Menu >
                        { productList.map((product, index) => 
                            <Dropdown.Item  key={'Product_Menu' + index} href="#" onClick={e => setSelectedProduct({...selectedProduct, id: product.id as number, name:product.name as string})}>
                                {product.name}
                            </Dropdown.Item>)}
                        </Dropdown.Menu>
                    </Dropdown>
                </InputGroup>
                
                <InputGroup>
                {
                (isLoadingProducts) ?
                    <Button variant="outline-secondary" disabled>
                        <Spinner
                        as="span"
                        animation="grow"
                        size="sm"
                        role="status"
                        aria-hidden="true"
                        />
                        Loading...
                    </Button>
                    :
                    <Button variant="outline-secondary" type="submit" 
                    onClick={() => {
                        if( orderId > 0 && selectedProduct.id > 0){
                            formData.productId = selectedProduct.id;
                            formData.orderId = orderId;
                            onCreatePressed(formData);
                            setFormData({...formData, productId: 0, orderId: 0, price: 0.0, qantity: 0, amount: 0, discount: 0 });
                        }                        
                    }}>Save</Button>
                }
                </InputGroup>
            </InputGroup>
        </div>
    );
};

const mapStateToProps = (state:any) => ({
    isLoadingProducts: getProductListLoading(state),
    productList: getProductList(state)
});

const mapDispatchToProps = (dispatch:any) => ({
    onCreatePressed: (formData: any) => dispatch(addExpence(formData)),
});

export default connect(mapStateToProps, mapDispatchToProps)(ExpenceForm);
