# frozen_string_literal: true

require 'pathname'

class Bundler::Diff::Tool
  attr_accessor :a_dir
  attr_accessor :a_output_dir

  attr_accessor :b_dir
  attr_accessor :b_output_dir

  def self.diff(a_spec, b_spec)
    tool = new
    tool.a_dir = Pathname(a_spec.gem_dir)
    tool.a_output_dir = Pathname(a_spec.full_name)
    tool.b_dir = Pathname(b_spec.gem_dir)
    tool.b_output_dir = Pathname(b_spec.full_name)
    tool.diff_entries
  end

  def diff_entries
    a_files = file_list(a_dir)
    b_files = file_list(b_dir)

    (a_files + b_files).uniq.sort.each do |path|
      a_path = a_files.include?(path) ? path : nil
      b_path = b_files.include?(path) ? path : nil

      diff(a_path, b_path)
    end
  end

  def diff(a_path, b_path)
    command = ['diff -u']

    command_for_output = ['diff']

    if a_path
      a_label = a_output_dir.join(a_path)

      command.concat [a_dir.join(a_path), '--label', a_label]
      command_for_output << a_label
    else
      command.concat ['/dev/null', '--label', '/dev/null']
      command_for_output << '/dev/null'
    end

    if b_path
      b_label = b_output_dir.join(b_path)

      command.concat [b_dir.join(b_path), '--label', b_label]
      command_for_output << b_label
    else
      command << ['/dev/null', '--label', '/dev/null']
      command_for_output << '/dev/null'
    end

    output = `#{command.join(' ')}`

    return if output.empty?

    puts command_for_output.join(' ')
    puts output
  end

  private

  def file_list(dir_path)
    paths = dir_path.glob('**/*').select(&:file?).map { |path| path.relative_path_from(dir_path) }
    paths.reject { |path| path.to_s.start_with?('ext/') }
  end
end
