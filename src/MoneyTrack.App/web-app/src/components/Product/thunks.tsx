import { ApiClient, ProductRequest, ProductResponse } from "../../clients/src/clients";
import {
    createProduct,
    loadProductListInProgress,
    loadProductListuccess,
    loadProductFailure,
    removeProduct
} from './actions';


export const addProduct = (name: string, productTypeId: number) => async (dispatch: any) => {
    try {

        let body = new ProductRequest();
        body.name = name;
        body.productTypeId = productTypeId;

        const client = new ApiClient();
        var response = await client.apiV1ProductPost(0, body);
        
        if(response.result.saved === true){
            let product = new ProductResponse();
            product.id = response.result.id;
            product.name = name;
            product.productTypeId = productTypeId;

            dispatch(createProduct(product));
        }else{
            dispatch(displayAlert("Product save error"));
        }

    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const loadProductList = () => async (dispatch: any, getState: any) => {
    try {
        dispatch(loadProductListInProgress());
        const client = new ApiClient();
        const response = await client.apiV1ProductList();

        dispatch(loadProductListuccess(response.result));
    } catch (e) {
        dispatch(loadProductFailure());
        dispatch(displayAlert(e));
    }
}

export const removeProductRequest = (id:number) => async (dispatch:any) => {
    try {
        const client = new ApiClient();
        const response = await client.apiV1ProductDelete(id);
        if(response && response.result && response.result.deleted === true){
            dispatch(removeProduct(id));
        }        
    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const displayAlert = (text: any) => () => {
    alert(text);
};