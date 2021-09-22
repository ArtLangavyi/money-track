import { ApiClient, ProductTypeRequest, ProductTypeResponse } from "../../../clients/src/clients";
import {
    createProductType,
    loadProductTypeListInProgress,
    loadProductTypeListuccess,
    loadProductTypeFailure,
    removeProductType
} from './actions';


export const addProductType = (name: string) => async (dispatch: any) => {
    try {

        let body = new ProductTypeRequest();
        body.name = name;

        const client = new ApiClient();
        var response = await client.apiV1ProductTypePost(0, body);
        if(response.result.saved === true){
            let productType = new ProductTypeResponse();
            productType.id = response.result.id;
            productType.name = name;
            dispatch(createProductType(productType));
        }else{
            dispatch(displayAlert("Product type save error"));
        }

    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const loadProductTypeList = () => async (dispatch: any, getState: any) => {
    try {
        dispatch(loadProductTypeListInProgress());
        const client = new ApiClient();
        const response = await client.apiV1ProductTypeList();

        dispatch(loadProductTypeListuccess(response.result));
    } catch (e) {
        dispatch(loadProductTypeFailure());
        dispatch(displayAlert(e));
    }
}

export const removeProductTypeRequest = (id:number) => async (dispatch:any) => {
    try {
        const client = new ApiClient();
        const response = await client.apiV1ProductTypeDelete(id);
        if(response && response.result && response.result.deleted === true){
            dispatch(removeProductType(id));
        }        
    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const displayAlert = (text: string) => () => {
    alert(text);
};