import { ExpenceResponse } from "../../clients/src/clients";
import {
    CREATE_EXPENCE,
    LOAD_EXPENCE_LIST_IN_PROGRESS,
    LOAD_EXPENCE_LIST_SUCCESS,
    LOAD_EXPENCE_LIST_FAILURE,
    REMOVE_EXPENCE
} from './actions';

const initialState = { isLoading: false, data: [] };
export const expenceList = (state = initialState, action:any) => {
    const { type, payload } = action;
    if(payload === undefined){
        return state;
    }
    
    const { orderId } = payload;
    let expenceList = state.data as Array<any>; // TODO: add strict class
    switch (type) {
        case CREATE_EXPENCE: {
            
            const { expence } = payload;
            expenceList[orderId].list.push(expence);
            return {
                ...state,
                data: expenceList,
            };
        }
        case LOAD_EXPENCE_LIST_SUCCESS: {
            const { list } = payload;
            if(list != null){
                expenceList[orderId] = {orderId, list, isLoading:false};
                return {
                    ...state,
                    isLoading: false,
                    data: expenceList,
                };
            }

            return {
                ...state,
                isLoading: true,
            }

        } 
        case LOAD_EXPENCE_LIST_IN_PROGRESS:       
            expenceList[orderId] = {orderId, list:[], isLoading:true};
            return {
                ...state,
                isLoading: true,
                data: expenceList,
            }
        case LOAD_EXPENCE_LIST_FAILURE:
            expenceList[orderId] = {orderId, list:[], isLoading:false};
            return {
                ...state,
                isLoading: true,
                data: expenceList,
            }
        case REMOVE_EXPENCE: {
                const { id } = payload;
                return {
                    ...state,
                    data: state.data.filter((expenceList:ExpenceResponse) => expenceList.id !== id),
                };
            }
        default:
            return state;
    }
}