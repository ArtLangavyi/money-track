import { ExpencePlaceResponse } from "../../../clients/src/clients";

export const CREATE_EXPENCE_PLACE = 'CREATE_EXPENCE_PLACE';
export const createExpencePlace = (expencePlace:ExpencePlaceResponse) => ({
    type: CREATE_EXPENCE_PLACE,
    payload: { expencePlace },
});

export const LOAD_EXPENCE_PLACE_LIST_IN_PROGRESS = 'LOAD_EXPENCE_PLACE_LIST_IN_PROGRESS';
export const loadExpencePlaceListInProgress = () => ({
    type: LOAD_EXPENCE_PLACE_LIST_IN_PROGRESS,
});

export const LOAD_EXPENCE_PLACE_LIST_SUCCESS = 'LOAD_EXPENCE_PLACE_LIST_SUCCESS';
export const loadExpencePlaceListuccess = (expencePlaceList:ExpencePlaceResponse[]) => ({
    type: LOAD_EXPENCE_PLACE_LIST_SUCCESS,
    payload: { expencePlaceList },
});

export const LOAD_EXPENCE_PLACE_LIST_FAILURE = 'LOAD_EXPENCE_PLACE_LIST_FAILURE';
export const loadExpencePlaceFailure = () => ({
    type: LOAD_EXPENCE_PLACE_LIST_FAILURE,
});

export const REMOVE_EXPENCE_PLACE = 'REMOVE_EXPENCE_PLACE';
export const removeExpencePlace = (id:number) => ({
    type: REMOVE_EXPENCE_PLACE,
    payload: { id },
});
