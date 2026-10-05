function sendSuccess(data) {
  return { status: 'success', data }
}

function sendError(error) {
  return { status: 'error', error }
}

function send(error, data) {
  return error ? sendError(error) : sendSuccess(data)

  // if (error) {
  //     return sendError(error)
  // } else {
  //     return sendSuccess(data)
  // }
}

// export all the functions
module.exports = {
  send,
  sendError,
  sendSuccess,
}
