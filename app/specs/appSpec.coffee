define ['app'], (App) ->
  describe "The app", () ->
    it "Should print in the console when started", () ->
      app = new App();
      app.start();
      expect(true).toBe true