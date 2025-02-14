{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      hack-font
      hackgen-font
      hackgen-nf-font
    ];
  };

  # macOS Sequoia では、nixbld ユーザーに新しいユーザー/グループ ID セットを使用する必要がある
  # ref: https://github.com/i077/system/blob/532b77c93ddc2e04ced0859b7cbb74f034d8f6bf/modules/darwin/default.nix#L15
  ids = {
    gids = {
      nixbld = 350;
    };
  };

  system = {
    # 下位互換性のため
    # ないとエラーで落ちた
    stateVersion = 4;

    # https://daiderd.com/nix-darwin/manual/index.html
    defaults = {
      # Finder ですべてのファイル拡張子を表示するかどうか
      NSGlobalDomain.AppleShowAllExtensions = true;
      finder = {
        # 隠しファイルを常に表示するかどうか。
        AppleShowAllFiles = true;
        # ファイル拡張子を常に表示するかどうか
        AppleShowAllExtensions = true;
      };
      dock = {
        # ドックを自動的に非表示または表示するかどうか。
        autohide = true;
        # ドックに最近使用したアプリケーションを表示します
        show-recents = false;
        # メニューバーの表示位置
        orientation = "left";
      };
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # nix-darwin によって生成された Brewfile にリストされていないパッケージ以外はアンインストールする。
      cleanup = "uninstall";
    };
    brews = [
      "cairo"
      "glib"
      "gobject-introspection"
      "golang-migrate"
      "libffi"
      "libpq"
      "luarocks"
      "poppler"
      "postgresql@14"
      "ruby-build"
    ];
    casks = [
      "arc"
      "figma"
      "firefox"
      "google-chrome"
      "microsoft-edge"
      "raycast"
      "sequel-ace"
      "slack"
      "tableplus"
      "wezterm@nightly"
      "zoom"
    ];
    taps = [
      "homebrew/bundle"
    ];
  };
}
