import { ApiClient, OrderRequest, OrderResponse } from "../../clients/src/clients";
import {
    createOrder,
    loadOrderListInProgress,
    loadOrderListuccess,
    loadOrderFailure,
    removeOrder
} from './actions';


export const addOrder = (data: any) => async (dispatch: any) => {
    try {

        let body = new OrderRequest();
        body.total = data.total;
        body.totalDiscount = data.totalDiscount;
        body.userId = data.userId;
        body.paymentDate = data.paymentDate;
        body.isAutomatedPayment = data.isAutomatedPayment;
        body.expencePlaceId = data.expencePlaceId;


        const client = new ApiClient();
        var response = await client.apiV1OrderPost(0, body);
        if(response.result.saved === true){
            let order = new OrderResponse();
            order.id = response.result.id;

            
            dispatch(createOrder(order));
        }else{
            dispatch(displayAlert("Product type save error"));
        }

    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const loadOrderList = () => async (dispatch: any, getState: any) => {
    try {
        dispatch(loadOrderListInProgress());
        const client = new ApiClient();
        const response = await client.apiV1OrderList();

        dispatch(loadOrderListuccess(response.result));
    } catch (e) {
        dispatch(loadOrderFailure());
        dispatch(displayAlert(e));
    }
}

export const removeOrderRequest = (id:number) => async (dispatch:any) => {
    try {
        const client = new ApiClient();
        const response = await client.apiV1OrderDelete(id);
        if(response && response.result && response.result.deleted === true){
            dispatch(removeOrder(id));
        }        
    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const displayAlert = (text: string) => () => {
    alert(text);
};