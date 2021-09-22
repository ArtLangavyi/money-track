import { ProductResponse } from "../../clients/src/clients";
import {
    CREATE_PRODUCT,
    LOAD_PRODUCT_LIST_IN_PROGRESS,
    LOAD_PRODUCT_LIST_SUCCESS,
    LOAD_PRODUCT_LIST_FAILURE,
    REMOVE_PRODUCT
} from './actions';

const initialState = { isLoading: false, data: [] };
export const productList = (state = initialState, action:any) => {
    const { type, payload } = action;

    switch (type) {
        case CREATE_PRODUCT: {
            const { product } = payload;
            return {
                ...state,
                data: state.data.concat(product),
            };
        }
        case LOAD_PRODUCT_LIST_SUCCESS: {
            const { productList } = payload;
            return {
                ...state,
                isLoading: false,
                data: productList,
            };
        } 
        case LOAD_PRODUCT_LIST_IN_PROGRESS:
            return {
                ...state,
                isLoading: true,
            }
        case LOAD_PRODUCT_LIST_FAILURE:
            return {
                ...state,
                isLoading: false,
            }
        case REMOVE_PRODUCT: {
                const { id } = payload;
                return {
                    ...state,
                    data: state.data.filter((productList:ProductResponse) => productList.id !== id),
                };
            }
        default:
            return state;
    }
}