import { OrderResponse } from "../../clients/src/clients";
import {
    CREATE_ORDER,
    LOAD_ORDER_LIST_IN_PROGRESS,
    LOAD_ORDER_LIST_SUCCESS,
    LOAD_ORDER_LIST_FAILURE,
    REMOVE_ORDER
} from './actions';

const initialState = { isLoading: false, data: [] };
export const orderList = (state = initialState, action:any) => {
    const { type, payload } = action;

    switch (type) {
        case CREATE_ORDER: {
            const { order } = payload;
            return {
                ...state,
                data: state.data.concat(order),
            };
        }
        case LOAD_ORDER_LIST_SUCCESS: {
            const { orderList } = payload;
            return {
                ...state,
                isLoading: false,
                data: orderList,
            };
        } 
        case LOAD_ORDER_LIST_IN_PROGRESS:
            return {
                ...state,
                isLoading: true,
            }
        case LOAD_ORDER_LIST_FAILURE:
            return {
                ...state,
                isLoading: false,
            }
        case REMOVE_ORDER: {
                const { id } = payload;
                return {
                    ...state,
                    data: state.data.filter((orderList:OrderResponse) => orderList.id !== id),
                };
            }
        default:
            return state;
    }
}