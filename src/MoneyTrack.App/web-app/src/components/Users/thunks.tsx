import { ApiClient, UserRequest, UserResponse } from "../../clients/src/clients";
import {
    createUser,
    loadUserListInProgress,
    loadUserListuccess,
    loadUserFailure,
    removeUser
} from './actions';


export const addUser = (data: any) => async (dispatch: any) => {
    try {

        let body = new UserRequest();
        body.firstName = data.firstName;
        body.middleName = data.middleName;
        body.lastName = data.lastName;

        const client = new ApiClient();
        var response = await client.apiV1UserPost(0, body);
        if(response.result.saved === true){
            let user = new UserResponse();
            user.id = response.result.id;
            user.firstName = data.firstName;
            user.middleName = data.middleName;
            user.lastName = data.lastName;
            
            dispatch(createUser(user));
        }else{
            dispatch(displayAlert("Product type save error"));
        }

    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const loadUserList = () => async (dispatch: any, getState: any) => {
    try {
        dispatch(loadUserListInProgress());
        const client = new ApiClient();
        const response = await client.apiV1UserList();

        dispatch(loadUserListuccess(response.result));
    } catch (e) {
        dispatch(loadUserFailure());
        dispatch(displayAlert(e));
    }
}

export const removeUserRequest = (id:number) => async (dispatch:any) => {
    try {
        const client = new ApiClient();
        const response = await client.apiV1UserDelete(id);
        if(response && response.result && response.result.deleted === true){
            dispatch(removeUser(id));
        }        
    } catch (e) {
        dispatch(displayAlert(e));
    }
}

export const displayAlert = (text: any) => () => {
    alert(text);
};