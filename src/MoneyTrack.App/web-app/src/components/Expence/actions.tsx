import { ExpenceResponse } from "../../clients/src/clients";

export const CREATE_EXPENCE = 'CREATE_EXPENCE';
export const createExpence = (orderId:number,expence:ExpenceResponse) => ({
    type: CREATE_EXPENCE,
    payload: { expence, orderId },
});

export const LOAD_EXPENCE_LIST_IN_PROGRESS = 'LOAD_EXPENCE_LIST_IN_PROGRESS';
export const loadExpenceListInProgress = (orderId:number) => ({
    type: LOAD_EXPENCE_LIST_IN_PROGRESS,
    payload: { orderId },
});

export const LOAD_EXPENCE_LIST_SUCCESS = 'LOAD_EXPENCE_LIST_SUCCESS';
export const loadExpenceListSuccess = (orderId:number, list:ExpenceResponse[]) => ({
    type: LOAD_EXPENCE_LIST_SUCCESS,
    payload: { orderId, list },
});

export const LOAD_EXPENCE_LIST_FAILURE = 'LOAD_EXPENCE_LIST_FAILURE';
export const loadExpenceListFailure = (orderId:number) => ({
    type: LOAD_EXPENCE_LIST_FAILURE,
    payload: { orderId },
});

export const REMOVE_EXPENCE = 'REMOVE_EXPENCE';
export const removeExpence = (id:number) => ({
    type: REMOVE_EXPENCE,
    payload: { id },
});
