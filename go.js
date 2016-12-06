const express = require('express')


// setup
const app = express()


// routes
app.all('/', (req, res) => {
  res.json({ message: 'not implemented!' })
})

// Woops!
app.use((req, res, next) => res.end(`
Hi, you curious (^_^). I'm #ME#.
repo: https://github.com/#USERNAME#/#PREFIX#-#PROJECT_NAME#.git
`))


// go!
app.on('error', console.error)
app.listen(process.env.NODE_PORT || process.env.PORT || 8000)
