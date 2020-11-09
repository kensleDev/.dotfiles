const fs = require('fs')
const prompt = require('prompt-sync')()

const questions = (questions) => {
  return questions
    .map((question) => {
      const answer = prompt(`${question}: `)
      //      console.clear()
      return { [question]: answer }
    })
    .reduce((r, c) => Object.assign(r, c), {})
}

const dataHelper = {
  store: (data, path) => {
    try {
      fs.writeFileSync(path, JSON.stringify(data))
    } catch (err) {
      console.error(err)
    }
  },

  load: (path) => {
    try {
      return fs.readFileSync(path, 'utf8')
    } catch (err) {
      console.error(err)
      return false
    }
  },

  append: (path, data) => {
    fs.appendFile(path, data, (err) => {
      if (err) throw err
      console.log(`-> Appended to ${path}`)
    })
  }
}

const logger = {
  add: (type, logMsg) => {
    const loggerMsg = `${type.toUpperCase()} - ${new Date().toString()} 
  - ${logMsg}
    `
    dataHelper.store('./log.txt', loggerMsg) 
  }
}

const log = {
  info: (msg) => {
    console.log(msg)
    logger.add('info', msg)
  },
  error: (msg) => {
    console.err(msg)
    logger.add('error', msg)
  } 
}

module.exports = {
  dataHelper,
  questions,
  log
}

