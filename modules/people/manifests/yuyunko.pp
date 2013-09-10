class people::yuyunko {
  # 自分の環境で欲しいresourceをincludeする
  include dropbox
  include skype
  include iterm2::stable #::devもある
  include chrome
  include firefox

  # homebrewでインストール
  package {
    [
      'tmux',
      'reattach-to-user-namespace',
      'tig',
      'git',
      'zsh',
      'ctags',
      'lv',
      'macvim --with-cscope --with-lua --HEAD',
      'git-now',
      'readline',
      'openssl'
    ]:
  }
  # 他のPP
  package {
  'Kobito':
    source   => "http://kobito.qiita.com/download/Kobito_v1.2.0.zip",
    provider => compressed_app;
  'XtraFinder':
    source   => "http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg",
    provider => pkgdmg;
  'GoogleJapaneseInput':
    source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
    provider => pkgdmg;
  'BetterTouchTool':
    source   => "http://www.boastr.de/BetterTouchTool.zip",
    provider => compressed_app;
  }

  $home     = "/Users/${::luser}"
  $src      = "${home}/src"
  #$dotfiles = "${src}/dotfiles"

  # ~/src/dotfilesにGitHub上のtaka84u9/dotfilesリポジトリを
  # git-cloneする。そのとき~/srcディレクトリがなければいけない。
  #repository { $dotfiles:
  #  source  => "taka84u9/dotfiles",
  #  require => File[$src]
  #}
  # git-cloneしたらインストールする
  #exec { "sh ${dotfiles}/install.sh":
  #  cwd => $dotfiles,
  #  creates => "${home}/.zshrc",
  #  require => Repository[$dotfiles],
  #}
}
