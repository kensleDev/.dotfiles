const uuid = require('uuid')
const { log, dataHelper, questions } = require('./utils')
const logLocation = '/home/kd/.config/nvim/rplugin/node/todo/logs'
class TodoService {

  get() {
    return [ ...require('./todos.json') ]
  }

  createTodoObject(todoArrLength) {
    const newTodo = { 
      ...questions(['title', 'desc']), 
      id: uuid.v1(), 
      priority: todoArrLength++ 
    }
    return newTodo
  }

  create() {
    const todoArr = this.get()
    const newTodo = this.createTodoObject(todoArr.length)
    const newTodoArr = [...todoArr, newTodo]
    dataHelper.store(newTodoArr, `${logLocation}/todos.json`)
    log.info(`-> Created! - New Todo: ${JSON.stringify(newTodo)}`)
  }

  delete(id) {
    const todoArr = this.get()
    const toBeDeleted = todoArr.find(todo => todo.id === id)
    if (todoArr.some(e => e.id === toBeDeleted.id)) {
      const newTodoArr = todoArr.filter(todo => todo.id !== id )
      const rejigged = newTodoArr.map(todo => {
        if (todo.priority > toBeDeleted.priority) {
          console.log(todo)
          todo.priority --
          return todo
        }
      })
      dataHelper.store(rejigged, `${logLocation}/todos.json`)
      log.info(`Deleted todo: ${toBeDeleted.title} - ${toBeDeleted.id} `)
    } else {
      log.error(`-> Error! - Cannot find item wihth ID of ${id}`)
    }
  }

  update(partialNewTodo) {
    if(!this.hasPrimaryKey(partialNewTodo)) {
      log.error('-> Error! - Cannot find id or prioity for update')
      return
    }
    let todoArr = this.get()
    
    let currentTodo = todoArr.filter(todo => todo.id === partialNewTodo.id)[0]
    if(!currentTodo) {
      currentTodo = todoArr.filter(todo => todo.priority === partialNewTodo.priority)[0]
      if(!currentTodo) {
        log.error('-> Error! - Cannot find id or prioity for update')
        return
      }
    }

    const mergedTodo = {...currentTodo, ...partialNewTodo}
    
    // update priority if it has one if not replace 
    if(partialNewTodo.priority) {
      if(mergedTodo.priority !== partialNewTodo.priority) {
        // update priority
        todoArr = this.updatePriority(todoArr, mergedTodo)
      }
    } else {
      todoArr = this.replaceTodo(todoArr, mergedTodo)
    }

    dataHelper.store(todoArr, `${logLocation}/todos.json`)
    
  }

  replaceTodo(todoArr, newTodo) {

    let currentIndex = todoArr.map((e) => e.id ).indexOf(newTodo.id)
    if (currentIndex < 0) { 
      currentIndex = todoArr.map(e => e.priority).indexOf(newTodo.priority)
    }
 
    todoArr.splice(currentIndex, 1, newTodo)
    return todoArr
  }
  
  updatePriority(todoArr, newTodo) {
    const currentTodo = todoArr.filter(todo => todo.id === newTodo.id)
    
    let higherThenCurrentPriority = todoArr
      .filter(todo => todo.priority > newTodo.priority)

    let lowerThenCurrentPriority = todoArr
      .filter(todo => todo.priority < newTodo.priority)
 
    if (newTodo.priority > currentTodo.priority) {
      lowerThenCurrentPriority = lowerThenCurrentPriority.map(todo => {
        if(todo.priority > currentTodo.priority) {
          todo.priority--
          return todo
        }  
      })
    } else if(newTodo.priority < currentTodo.priority) {
      higherThenCurrentPriority = higherThenCurrentPriority.map(todo => {
        if(todo.priority < currentTodo.priority) {
          todo.priority++
        }
      })
    }
    
    return [...lowerThenCurrentPriority, newTodo, ...higherThenCurrentPriority]
    
  }

  hasPrimaryKey(todo) {
    return todo.hasOwnProperty('id') || todo.hasOwnProperty('priority')
  }

}

module.exports = new TodoService() 

// todoService.create()
// todoService.delete('902c5200-21ab-11eb-99a7-ef2bea67452f')
// todoService.update({id: '921adb90-21ab-11eb-831a-ad1b9c53aaef', title: 'update test'})
// todoService.update({priority: 0, title: 'new new new'})

