import axios from 'axios';
import { BASE_URL } from './../utils/config';

export function foodMenu() {
    const URL = BASE_URL + '/food/menu'
    return axios.get(URL)
}