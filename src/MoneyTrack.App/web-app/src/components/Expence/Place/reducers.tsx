import { ExpencePlaceResponse } from "../../../clients/src/clients";
import {
    CREATE_EXPENCE_PLACE,
    LOAD_EXPENCE_PLACE_LIST_IN_PROGRESS,
    LOAD_EXPENCE_PLACE_LIST_SUCCESS,
    LOAD_EXPENCE_PLACE_LIST_FAILURE,
    REMOVE_EXPENCE_PLACE
} from './actions';

const initialState = { isLoading: false, data: [] };
export const expencePlaceList = (state = initialState, action:any) => {
    const { type, payload } = action;

    switch (type) {
        case CREATE_EXPENCE_PLACE: {
            const { expencePlace } = payload;
            return {
                ...state,
                data: state.data.concat(expencePlace),
            };
        }
        case LOAD_EXPENCE_PLACE_LIST_SUCCESS: {
            const { expencePlaceList } = payload;
            return {
                ...state,
                isLoading: false,
                data: expencePlaceList,
            };
        } 
        case LOAD_EXPENCE_PLACE_LIST_IN_PROGRESS:
            return {
                ...state,
                isLoading: true,
            }
        case LOAD_EXPENCE_PLACE_LIST_FAILURE:
            return {
                ...state,
                isLoading: false,
            }
        case REMOVE_EXPENCE_PLACE: {
                const { id } = payload;
                return {
                    ...state,
                    data: state.data.filter((expencePlaceList:ExpencePlaceResponse) => expencePlaceList.id !== id),
                };
            }
        default:
            return state;
    }
}