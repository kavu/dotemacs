# -*- Ruby -*-

require 'fileutils'

desc "Compile rc-* config files" 

rule '.elc' => '.el' do |t|
  sh "emacs --batch -L /usr/lib/erlang/lib/tools-2.6.5.1/emacs -L packages/slime -L packages/color-theme -L packages/distel/elisp -L packages/org/lisp -L packages/org/contrib -L packages/yasnippet -L packages/magit -L packages/gist -L packages/ruby-mode -L packages/ruby-complexity -L packages/rspec-mode -L packages/cucumber -L packages/yaml-mode -L packages/emacs-rails-reloaded -L packages/rdebug -L packages/rhtml-mode -L packages/zencoding -L packages/regex-tool -L packages/emms/lisp -L packages/google-maps -L packages/rainbow-mode -L packages/haskell-mode -L packages --eval \"(byte-compile-file \\\"#{t.source}\\\")\""
end
task :compile => FileList["rc/*.el","packages/*.el"].ext('elc')

task :default => :compile
