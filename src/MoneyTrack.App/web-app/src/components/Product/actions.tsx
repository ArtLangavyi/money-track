import { ProductResponse } from "../../clients/src/clients";

export const CREATE_PRODUCT = 'CREATE_PRODUCT';
export const createProduct = (product:ProductResponse) => ({
    type: CREATE_PRODUCT,
    payload: { product },
});

export const LOAD_PRODUCT_LIST_IN_PROGRESS = 'LOAD_PRODUCT_LIST_IN_PROGRESS';
export const loadProductListInProgress = () => ({
    type: LOAD_PRODUCT_LIST_IN_PROGRESS,
});

export const LOAD_PRODUCT_LIST_SUCCESS = 'LOAD_PRODUCT_LIST_SUCCESS';
export const loadProductListuccess = (productList:ProductResponse[]) => ({
    type: LOAD_PRODUCT_LIST_SUCCESS,
    payload: { productList },
});

export const LOAD_PRODUCT_LIST_FAILURE = 'LOAD_PRODUCT_LIST_FAILURE';
export const loadProductFailure = () => ({
    type: LOAD_PRODUCT_LIST_FAILURE,
});

export const REMOVE_PRODUCT = 'REMOVE_PRODUCT';
export const removeProduct = (id:number) => ({
    type: REMOVE_PRODUCT,
    payload: { id },
});
