ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="robbyrussell"
ZSH_THEME="geoffgarside"

# Save a ton of history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rake bundler brew gem osx)

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/functions

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

export EDITOR=mvim

# Customize to your needs...
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
export PATH="/usr/local/npm/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

# No rbenv init for faster login (needs manual rehash)
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Shaves about 0.5s off Rails boot time (when using perf patch). Taken from https://gist.github.com/1688857
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# init z https://github.com/rupa/z
. ~/z/z.sh
