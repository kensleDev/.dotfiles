// const utils = require('./utils')
// console.log(utils)

const fs = require("fs")
const logLocation = '/home/kd/.config/nvim/rplugin/node/todoPlug/logs'


const dataHelper = {
  store: (data, path) => {
    try {
      return fs.writeFileSync(path, JSON.stringify(data))
    } catch (err) {
      console.error(err)
      return false
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
    return fs.appendFile(path, data, (err) => {
      if (err) throw err
      console.log(`-> Appended to ${path}`)
    })
  }
}

const renderTodos = () => {
  const todosJson = require(`${logLocation}/todos.json`)
  const txtTodos = todosJson.map(todo => {
    return `${todo.priority}. ${todo.title} - ${todo.desc ? todo.desc : ''}`
  }).join('\n')

  dataHelper.store(txtTodos, `${logLocation}/todo.md`)
}


module.exports = (plugin) => {
  
  function setLine() {
    plugin.nvim.setLine('A line, for your troubles');
  }
  
  async function openTodoFile() {
    plugin.nvim.command(`:e ${logLocation}/todo.md`)
	}

  plugin.registerCommand('Todo', [plugin.nvim.command, openTodoFile] )
};
