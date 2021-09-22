import { ApiClient, ExpencePlaceRequest, ExpencePlaceResponse } from "../../../clients/src/clients";
import {
    createExpencePlace,
    loadExpencePlaceListInProgress,
    loadExpencePlaceListuccess,
    loadExpencePlaceFailure,
    removeExpencePlace
} from './actions';


export const addExpencePlace = (name: string) => async (dispatch: any) => {
    try {

        let body = new ExpencePlaceRequest();
        body.name = name;

        const client = new ApiClient();
        var response = await client.apiV1ExpencePlacePost(0, body);
        if(response.result.saved === true){
            let expencePlace = new ExpencePlaceResponse();
            expencePlace.id = response.result.id;
            expencePlace.name = name;
            dispatch(createExpencePlace(expencePlace));
        }else{
            dispatch(displayAlert("add Expence Place save error"));
        }

    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const loadExpencePlaceList = () => async (dispatch: any, getState: any) => {
    try {
        dispatch(loadExpencePlaceListInProgress());
        const client = new ApiClient();
        const response = await client.apiV1ExpencePlaceList();

        dispatch(loadExpencePlaceListuccess(response.result));
    } catch (e) {
        dispatch(loadExpencePlaceFailure());
        dispatch(displayAlert(e));
    }
}

export const removeExpencePlaceRequest = (id:number) => async (dispatch:any) => {
    try {
        const client = new ApiClient();
        const response = await client.apiV1ExpencePlaceDelete(id);
        if(response && response.result && response.result.deleted === true){
            dispatch(removeExpencePlace(id));
        }        
    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const displayAlert = (text: string) => () => {
    alert(text);
};