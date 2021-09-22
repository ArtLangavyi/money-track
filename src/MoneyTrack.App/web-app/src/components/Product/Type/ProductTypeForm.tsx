import React, { useState } from 'react';
import { connect } from 'react-redux';
import { Button, InputGroup, Form } from 'react-bootstrap';
import { ProductTypeResponse } from "../../../clients/src/clients";
import { getProductTypeList } from './selectors';
import { addProductType } from './thunks';

const ProductTypeForm = ({ productTypeList, onCreatePressed }: { productTypeList:ProductTypeResponse[], onCreatePressed:any }) => {
    const [inputValue, setInputValue] = useState('');

    return (
        <div>
            <InputGroup className="mb-3">
                <Form.Control
                name="name" 
                type="text"
                placeholder="Product type name"
                aria-label="Product type name"
                aria-describedby="basic-addon2"
                onChange={e => setInputValue(e.target.value)}
                required
                />
                <InputGroup.Append>
                <Button variant="outline-secondary" type="submit" 
                onClick={() => {
                    const isDuplicateText =
                    productTypeList.some(productType => productType.name === inputValue);
                    if (!isDuplicateText) {
                        onCreatePressed(inputValue);
                        setInputValue('');
                    }
                }}>Save</Button>
                </InputGroup.Append>
            </InputGroup>
        </div>
    );
};

const mapStateToProps = (state:any) => ({
    productTypeList: getProductTypeList(state),
});

const mapDispatchToProps = (dispatch:any) => ({
    onCreatePressed: (text: string) => dispatch(addProductType(text)),
});

export default connect(mapStateToProps, mapDispatchToProps)(ProductTypeForm);