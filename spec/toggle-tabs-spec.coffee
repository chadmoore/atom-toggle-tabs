{WorkspaceView} = require 'atom'
ToggleTabs = require '../lib/toggle-tabs'

describe "ToggleTabs", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('toggle-tabs')

  describe 'when the toggle-tabs:toggle event is triggered', ->
    it 'shows and hides the .tab-bar', ->
      expect(atom.workspaceView.find('.tab-bar:visible').length).toBe(1)
      atom.workspaceView.trigger 'toggle-tabs:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.tab-bar:visible').length).toBe(0)
        atom.workspaceView.trigger 'toggle-tabs:toggle'
        expect(atom.workspaceView.find('.tab-bar:visible').length).toBe(1)
