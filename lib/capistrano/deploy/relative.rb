Rake::Task["deploy:symlink:linked_dirs"].clear_actions
Rake::Task["deploy:symlink:linked_files"].clear_actions
Rake::Task["deploy:symlink:release"].clear_actions

Rake::Task["deploy:symlink:release"].reenable

namespace :deploy do
  namespace :symlink do
    desc 'Symlink release to current'
    task :release do
      on release_roles :all do
        tmp_current_path = release_path.parent.join(current_path.basename)
        execute :ln, '-s', release_path.relative_path_from(current_path.dirname), tmp_current_path
        execute :mv, tmp_current_path, current_path.parent
      end
    end

    desc 'Symlink files and directories from shared to release'
    task :shared do
      Rake::Task["deploy:symlink:linked_dirs"].reenable
      Rake::Task["deploy:symlink:linked_files"].reenable
      invoke 'deploy:symlink:linked_files'
      invoke 'deploy:symlink:linked_dirs'
    end

    desc 'Symlink linked directories'
    task :linked_dirs do
      next unless any? :linked_dirs
      on release_roles :all do
        execute :mkdir, '-p', linked_dir_parents(release_path)

        fetch(:linked_dirs).each do |dir|
          target = release_path.join(dir)
          source = shared_path.join(dir)
          unless test "[ -L #{target} ]"
            if test "[ -d #{target} ]"
              execute :rm, '-rf', target
            end
            execute :ln, '-s', source.relative_path_from(target.dirname), target
          end
        end
      end
    end

    desc 'Symlink linked files'
    task :linked_files do
      next unless any? :linked_files
      on release_roles :all do
        execute :mkdir, '-p', linked_file_dirs(release_path)

        fetch(:linked_files).each do |file|
          target = release_path.join(file)
          source = shared_path.join(file)
          unless test "[ -L #{target} ]"
            if test "[ -f #{target} ]"
              execute :rm, target
            end
            execute :ln, '-s', source.relative_path_from(target.dirname), target
          end
        end
      end
    end
  end
end
