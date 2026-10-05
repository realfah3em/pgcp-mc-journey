import { BASE_URL } from "../utils/config";
import axios from 'axios'

export function userSignIn(email, password) {
    const URL = BASE_URL + '/user/signin'
    const body = { email, password }
    return axios.post(URL, body)
}

export function userSignup(body) {
    const URL = BASE_URL + '/user/signup'
    return axios.post(URL, body)
}

export function userProfile(token) {
    const URL = BASE_URL + '/user'
    const headers = { token }
    return axios.get(URL, { headers })
}

export function userUpdate(token, mobile) {
    const URL = BASE_URL + '/user'
    const body = { mobile }
    const headers = { token }
    return axios.put(URL, body, { headers })
}