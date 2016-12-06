const express = require('express')


// setup
const app = express()


// routes


// go!
app.on('error', console.error)
app.listen(process.env.NODE_PORT || 8000)
