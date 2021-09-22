import { ApiClient, ExpenceRequest, ExpenceResponse } from "../../clients/src/clients";
import {
    createExpence,
    loadExpenceListInProgress,
    loadExpenceListSuccess,
    loadExpenceListFailure,
    removeExpence
} from './actions';


export const addExpence = (data: any) => async (dispatch: any) => {
    try {

        let body = new ExpenceRequest();
        body.orderId = data.orderId;
        body.productId = data.productId;
        body.price = data.price;
        body.qantity = data.qantity;
        body.amount = data.amount;
        body.discount = data.discount;

        const client = new ApiClient();
        var response = await client.apiV1ExpencePost(0, body);
        if(response.result.saved === true){
            let expence = new ExpenceResponse();
            expence.id = response.result.id;
            expence.productName = data.productName;
            expence.price = data.price;
            expence.qantity = data.qantity;
            expence.amount = data.amount;
            expence.discount = data.discount;
            expence.createdDate = new Date();
            
            dispatch(createExpence(data.orderId, expence));
        }else{
            dispatch(displayAlert("Expence save error"));
        }

    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const loadExpenceList = (orderId:number) => async (dispatch: any, getState: any) => {
    try {
        dispatch(loadExpenceListInProgress(orderId));
        const client = new ApiClient();
        const response = await client.apiV1ExpenceList(orderId);
        dispatch(loadExpenceListSuccess(orderId, response.result));
    } catch (e) {
        dispatch(loadExpenceListFailure(orderId));
        dispatch(displayAlert(e));
    }
}

export const removeExpenceRequest = (id:number) => async (dispatch:any) => {
    try {
        const client = new ApiClient();
        const response = await client.apiV1ExpenceDelete(id);
        if(response && response.result && response.result.deleted === true){
            dispatch(removeExpence(id));
        }        
    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const displayAlert = (text: string) => () => {
    alert(text);
};