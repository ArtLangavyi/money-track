import React, { useEffect } from 'react';
import { connect, useDispatch } from 'react-redux';
import { ListGroup } from 'react-bootstrap';
import {
    getProductList,
    getProductListLoading,
} from './selectors';
import { ProductResponse } from "../../clients/src/clients";
import { Spinner } from 'react-bootstrap';
import ProductItem from './ProductItem';
import { loadProductList, removeProductRequest } from './thunks';
import ProductForm from './ProductForm';

const ProductList = ({  productList, isLoading, onRemovePressed }
    :{  productList:ProductResponse[], isLoading:any, onRemovePressed:any }) => {
    
    const dispatch = useDispatch();
    useEffect(() => {
        dispatch(loadProductList())
    }, [dispatch]);
    
    const loadingMessage = <div> <Spinner
                                    as="span"
                                    animation="border"
                                    size="sm"
                                    role="status"
                                    aria-hidden="true"
                                /> Loading...</div>;
    const content = (
        <div>
            <ProductForm />
            <h3>Products:</h3>
                <ListGroup as="ul"  >
                    { productList.map((product, index) => 
                        <ProductItem
                            key={'ProductList_'+product.id}
                            product={product}
                            onRemovePressed={onRemovePressed}/>)}
                </ListGroup>
        </div>
    );
    return isLoading ? loadingMessage : content;
};

const mapStateToProps = (state:any) => ({
    isLoading: getProductListLoading(state),
    productList: getProductList(state),
});

const mapDispatchToProps = (dispatch:any) => ({
    onRemovePressed: (id:number) => dispatch(removeProductRequest(id)),
});

export default connect(mapStateToProps, mapDispatchToProps)(ProductList);
