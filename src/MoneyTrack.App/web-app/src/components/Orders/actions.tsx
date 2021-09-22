import { OrderResponse } from "../../clients/src/clients";

export const CREATE_ORDER = 'CREATE_ORDER';
export const createOrder = (order:OrderResponse) => ({
    type: CREATE_ORDER,
    payload: { order },
});

export const LOAD_ORDER_LIST_IN_PROGRESS = 'LOAD_ORDER_LIST_IN_PROGRESS';
export const loadOrderListInProgress = () => ({
    type: LOAD_ORDER_LIST_IN_PROGRESS,
});

export const LOAD_ORDER_LIST_SUCCESS = 'LOAD_ORDER_LIST_SUCCESS';
export const loadOrderListuccess = (orderList:OrderResponse[]) => ({
    type: LOAD_ORDER_LIST_SUCCESS,
    payload: { orderList },
});

export const LOAD_ORDER_LIST_FAILURE = 'LOAD_ORDER_LIST_FAILURE';
export const loadOrderFailure = () => ({
    type: LOAD_ORDER_LIST_FAILURE,
});

export const REMOVE_ORDER = 'REMOVE_ORDER';
export const removeOrder = (id:number) => ({
    type: REMOVE_ORDER,
    payload: { id },
});
