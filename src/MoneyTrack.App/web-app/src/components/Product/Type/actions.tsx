import { ProductTypeResponse } from "../../../clients/src/clients";

export const CREATE_PRODUCT_TYPE = 'CREATE_PRODUCT_TYPE';
export const createProductType = (productType:ProductTypeResponse) => ({
    type: CREATE_PRODUCT_TYPE,
    payload: { productType },
});

export const LOAD_PRODUCT_TYPE_LIST_IN_PROGRESS = 'LOAD_PRODUCT_TYPE_LIST_IN_PROGRESS';
export const loadProductTypeListInProgress = () => ({
    type: LOAD_PRODUCT_TYPE_LIST_IN_PROGRESS,
});

export const LOAD_PRODUCT_TYPE_LIST_SUCCESS = 'LOAD_PRODUCT_TYPE_LIST_SUCCESS';
export const loadProductTypeListuccess = (productTypeList:ProductTypeResponse[]) => ({
    type: LOAD_PRODUCT_TYPE_LIST_SUCCESS,
    payload: { productTypeList },
});

export const LOAD_PRODUCT_TYPE_LIST_FAILURE = 'LOAD_PRODUCT_TYPE_LIST_FAILURE';
export const loadProductTypeFailure = () => ({
    type: LOAD_PRODUCT_TYPE_LIST_FAILURE,
});

export const REMOVE_PRODUCT_TYPE = 'REMOVE_PRODUCT_TYPE';
export const removeProductType = (id:number) => ({
    type: REMOVE_PRODUCT_TYPE,
    payload: { id },
});
