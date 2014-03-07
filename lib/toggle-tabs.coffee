module.exports =
  configDefaults:
    hideTabs: false

  activate: ->
    atom.workspaceView.ready ->
      atom.workspaceView.find('.tab-bar').toggle(!atom.config.get('toggle-tabs.hideTabs'))

    atom.workspaceView.command "toggle-tabs:toggle", => @toggle()
    atom.config.observe 'toggle-tabs.hideTabs', =>
      current = atom.config.get('toggle-tabs.hideTabs')
      if current
        atom.workspaceView.find('.tab-bar').hide(150)
      else
        atom.workspaceView.find('.tab-bar').show(150)

  toggle: ->
    atom.config.set 'toggle-tabs.hideTabs', !atom.config.get('toggle-tabs.hideTabs')
