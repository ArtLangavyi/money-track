import { UserResponse } from "../../clients/src/clients";
import {
    CREATE_USER,
    LOAD_USER_LIST_IN_PROGRESS,
    LOAD_USER_LIST_SUCCESS,
    LOAD_USER_LIST_FAILURE,
    REMOVE_USER
} from './actions';

const initialState = { isLoading: false, data: [] };
export const userList = (state = initialState, action:any) => {
    const { type, payload } = action;

    switch (type) {
        case CREATE_USER: {
            const { user } = payload;
            return {
                ...state,
                data: state.data.concat(user),
            };
        }
        case LOAD_USER_LIST_SUCCESS: {
            const { userList } = payload;
            return {
                ...state,
                isLoading: false,
                data: userList,
            };
        } 
        case LOAD_USER_LIST_IN_PROGRESS:
            return {
                ...state,
                isLoading: true,
            }
        case LOAD_USER_LIST_FAILURE:
            return {
                ...state,
                isLoading: false,
            }
        case REMOVE_USER: {
                const { id } = payload;
                return {
                    ...state,
                    data: state.data.filter((userList:UserResponse) => userList.id !== id),
                };
            }
        default:
            return state;
    }
}