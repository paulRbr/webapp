define ['app'], (App) ->
  describe "The app", ->
    beforeEach ->
      spyOn console, 'log'
    it "Should print in the console when started", ->
      app = new App();
      app.start();
      expect(console.log).toHaveBeenCalled()