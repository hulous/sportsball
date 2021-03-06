module AppComponent
  class Engine < ::Rails::Engine
    isolate_namespace AppComponent

    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s + File::SEPARATOR)
        app.config.paths["db/migrate"].concat(config.paths["db/migrate"].expanded)
      end
    end

    config.generators do |generator|
      generator.orm(:active_record)
      generator.template_engine(:slim)
      generator.test_framework(:rspec)
    end
  end
end
