

module.exports = (plugin) => {

  
  function openTodoFile(plugin) {
    plugin.nvim.command('')
  } 

  function setLine(plugin) {
    plugin.nvim.setLine('A line, for your troubles')
  }

  plugin.registerCommand('SetMyLine', [plugin.nvim.buffer, setLine])
}
