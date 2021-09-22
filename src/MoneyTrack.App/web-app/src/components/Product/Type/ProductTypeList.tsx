import React, { useEffect } from 'react';
import { connect, useDispatch } from 'react-redux';
import { ListGroup } from 'react-bootstrap';
import {
    getProductTypeList,
    getProductTypeListLoading,
} from './selectors';
import { ProductTypeResponse } from "../../../clients/src/clients";
import { Spinner } from 'react-bootstrap';
import ProductTypeForm from './ProductTypeForm';
import ProductTypeItem from './ProductTypeItem';
import { loadProductTypeList, removeProductTypeRequest } from './thunks';

const ProductTypeList = ({  productTypeList, isLoading, onRemovePressed }
    :{  productTypeList:ProductTypeResponse[], isLoading:any, onRemovePressed:any }) => {
    
    const dispatch = useDispatch();
    useEffect(() => {
        dispatch(loadProductTypeList());
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
            <ProductTypeForm />
            <h3>Product Types:</h3>
            {productTypeList.map((productType, index) => 
                <ListGroup as="ul" key={'productTypeList' + index}>
                    <ProductTypeItem
                        key={productType.id}
                        productType={productType}
                        onRemovePressed={onRemovePressed}/>
                </ListGroup>)}
        </div>
    );
    return isLoading ? loadingMessage : content;
};

const mapStateToProps = (state:any) => ({
    isLoading: getProductTypeListLoading(state),
    productTypeList: getProductTypeList(state),
});

const mapDispatchToProps = (dispatch:any) => ({
    onRemovePressed: (id:number) => dispatch(removeProductTypeRequest(id)),
});

export default connect(mapStateToProps, mapDispatchToProps)(ProductTypeList);
