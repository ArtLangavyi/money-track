import React, { useState, useEffect } from 'react';
import { connect, useDispatch } from 'react-redux';
import { Button, InputGroup, Form, Spinner, Dropdown } from 'react-bootstrap';
import { ProductResponse, ProductTypeResponse} from "../../clients/src/clients";
import { getProductList } from './selectors';
import { addProduct } from './thunks';
import { getProductTypeList, getProductTypeListLoading } from './Type/selectors';
import { loadProductTypeList } from './Type/thunks';

const ProductForm = ({ productList, productTypeList, onCreatePressed, isLoadingProductTypes }
    : { productList:ProductResponse[], productTypeList:ProductTypeResponse[], onCreatePressed:any, isLoadingProductTypes:any }) => {
    const [formData, setFormData] = useState({
        name: '',
        productTypeId: 0
      });

    const [selectedProductType, setSelectedProductType] = useState({
        id: 0,
        name: 'Type'
      });

    const dispatch = useDispatch();
    useEffect(() => {
        dispatch(loadProductTypeList());
    }, [dispatch]);
    

    return (
        <div>
            <InputGroup className="mb-3">
                <Form.Control
                name="name" 
                type="text"
                value={formData.name}
                placeholder="Product name"
                aria-label="Product name"
                aria-describedby="basic-addon2"
                onChange={e => setFormData({...formData, name: e.target.value})}
                required
                />
                <InputGroup.Append className="mb-3">
                    <Dropdown>
                        <Dropdown.Toggle variant="success" id="dropdown-basic">
                            {selectedProductType.name as string}
                        </Dropdown.Toggle>
                        <Dropdown.Menu >
                        { productTypeList.map((productType, index) => 
                            <Dropdown.Item  key={'ProductForm_Type_Menu' + index} href="#" onClick={e => setSelectedProductType({...selectedProductType, id: productType.id as number, name: productType.name as string})}>
                                {productType.name}
                            </Dropdown.Item>)}
                        </Dropdown.Menu>
                    </Dropdown>
                </InputGroup.Append>
                <InputGroup.Append>
                {
                isLoadingProductTypes ?
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
                        const isDuplicateText =
                        productList.some(product => product.name === formData.name);
                        if (!isDuplicateText) {
                            formData.productTypeId = selectedProductType.id;
                            onCreatePressed(formData);
                            setFormData({...formData, name: "", productTypeId:0})
                        }
                    }}>Save</Button>
                }
                </InputGroup.Append>
            </InputGroup>
        </div>
    );
};

const mapStateToProps = (state:any) => ({
    isLoadingProductTypes: getProductTypeListLoading(state),
    productList: getProductList(state),
    productTypeList: getProductTypeList(state),
});

const mapDispatchToProps = (dispatch:any) => ({
    onCreatePressed: (formData: any) => dispatch(addProduct(formData.name,formData.productTypeId)),
});

export default connect(mapStateToProps, mapDispatchToProps)(ProductForm);
