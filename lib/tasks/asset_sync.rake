namespace :assets do

  desc 'Synchronize assets to remote (assumes assets are already compiled)'
  task :sync => :environment do
    AssetSync.sync
  end

  namespace :sync do
    desc 'Delete out-of-sync files on remote'
    task :clean => :environment do
      AssetSync.clean
    end

    desc "Download a manifest and asset files"
    task :download => :environment do
      Rake::Task["assets:sync:download:manifest"].invoke
      Rake::Task["assets:sync:download:asset_files"].invoke
    end

    namespace :download do
      desc "Download a manifest"
      task :manifest => :environment do
        AssetSync.download(:manifest)
      end

      desc "Download asset files"
      task :asset_files => :environment do
        AssetSync.download(:asset_files)
      end
  end

end

if Rake::Task.task_defined?("assets:precompile:nondigest")
  Rake::Task["assets:precompile:nondigest"].enhance do
    # Conditional execution needs to be inside the enhance block because the enhance block
    # will get executed before yaml or Rails initializers.
    Rake::Task["assets:sync"].invoke if defined?(AssetSync) && AssetSync.config.run_on_precompile
  end
else
  Rake::Task["assets:precompile"].enhance do
    # rails 3.1.1 will clear out Rails.application.config if the env vars
    # RAILS_GROUP and RAILS_ENV are not defined. We need to reload the
    # assets environment in this case.
    # Rake::Task["assets:environment"].invoke if Rake::Task.task_defined?("assets:environment")
    Rake::Task["assets:sync"].invoke if defined?(AssetSync) && AssetSync.config.run_on_precompile
  end
end
