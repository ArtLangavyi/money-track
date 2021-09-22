import { UserResponse } from "../../clients/src/clients";

export const CREATE_USER = 'CREATE_USER';
export const createUser = (user:UserResponse) => ({
    type: CREATE_USER,
    payload: { user },
});

export const LOAD_USER_LIST_IN_PROGRESS = 'LOAD_USER_LIST_IN_PROGRESS';
export const loadUserListInProgress = () => ({
    type: LOAD_USER_LIST_IN_PROGRESS,
});

export const LOAD_USER_LIST_SUCCESS = 'LOAD_USER_LIST_SUCCESS';
export const loadUserListuccess = (userList:UserResponse[]) => ({
    type: LOAD_USER_LIST_SUCCESS,
    payload: { userList },
});

export const LOAD_USER_LIST_FAILURE = 'LOAD_USER_LIST_FAILURE';
export const loadUserFailure = () => ({
    type: LOAD_USER_LIST_FAILURE,
});

export const REMOVE_USER = 'REMOVE_USER';
export const removeUser = (id:number) => ({
    type: REMOVE_USER,
    payload: { id },
});
