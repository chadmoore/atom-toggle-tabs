module.exports =
  configDefaults:
    hideTabsByDefault: false

  activate: ->
    atom.workspaceView.find('.tab-bar').toggle(
      !atom.config.get('toggle-tabs.hideTabsByDefault')
    )
    atom.workspaceView.command "toggle-tabs:toggle", => @toggle()

  toggle: ->
    atom.workspaceView.find('.tab-bar').slideToggle(150)
