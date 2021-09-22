import { ProductTypeResponse } from "../../../clients/src/clients";
import {
    CREATE_PRODUCT_TYPE,
    LOAD_PRODUCT_TYPE_LIST_IN_PROGRESS,
    LOAD_PRODUCT_TYPE_LIST_SUCCESS,
    LOAD_PRODUCT_TYPE_LIST_FAILURE,
    REMOVE_PRODUCT_TYPE
} from './actions';

const initialState = { isLoading: false, data: [] };
export const productTypeList = (state = initialState, action:any) => {
    const { type, payload } = action;

    switch (type) {
        case CREATE_PRODUCT_TYPE: {
            const { productType } = payload;
            return {
                ...state,
                data: state.data.concat(productType),
            };
        }
        case LOAD_PRODUCT_TYPE_LIST_SUCCESS: {
            const { productTypeList } = payload;
            return {
                ...state,
                isLoading: false,
                data: productTypeList,
            };
        } 
        case LOAD_PRODUCT_TYPE_LIST_IN_PROGRESS:
            return {
                ...state,
                isLoading: true,
            }
        case LOAD_PRODUCT_TYPE_LIST_FAILURE:
            return {
                ...state,
                isLoading: false,
            }
        case REMOVE_PRODUCT_TYPE: {
                const { id } = payload;
                return {
                    ...state,
                    data: state.data.filter((productTypeList:ProductTypeResponse) => productTypeList.id !== id),
                };
            }
        default:
            return state;
    }
}