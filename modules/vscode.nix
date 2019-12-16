{ pkgs, ... }: {
  # Settings
  programs.zsh.shellAliases.code = "codium";
  home-manager.users.giacomo.programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions;
      [
        # Empty
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-django";
          publisher = "batisteo";
          version = "0.19.0";
          sha256 =
            "d2756e99f01c9b4f9a91d5e9137bb175bb1cf18ed96c1dac1f82278bdbccc9ae";
        }
        {
          name = "Nix";
          publisher = "bbenoist";
          version = "1.0.1";
          sha256 =
            "ab0c6a386b9b9507953f6aab2c5f789dd5ff05ef6864e9fe64c0855f5cb2a07d";
        }
        {
          name = "vagrant";
          publisher = "bbenoist";
          version = "0.5.0";
          sha256 =
            "dd005fda1ff7452efa01bcbf7cb8aec2257a1a4c77b0136db1a21cceacd979ba";
        }
        {
          name = "better-toml";
          publisher = "bungcip";
          version = "0.3.2";
          sha256 =
            "83e2df8230274ae4a3fe74a694f741d2ddbd92a4e67a0641e41d5c6333fc9022";
        }
        {
          name = "gitignore";
          publisher = "codezombiech";
          version = "0.6.0";
          sha256 =
            "0ba818f61483f3ba177073f77578364300b9ddad4be146914e6df21b9201cc3e";
        }
        {
          name = "systemd-unit-file";
          publisher = "coolbear";
          version = "1.0.6";
          sha256 =
            "661c52513df3a9d3cd8879df683a7f2d0886c5348b635569739cc46e9bfe8069";
        }
        {
          name = "vscode-eslint";
          publisher = "dbaeumer";
          version = "2.0.5";
          sha256 =
            "29fe81a9845472a9a74696d0bde15ba6ba166cb0a9e1a59ade92f0fbfcc07ab1";
        }
        {
          name = "python-extension-pack";
          publisher = "donjayamanne";
          version = "1.6.0";
          sha256 =
            "a45b4834bbfee4cdea3f4dfba6ed7207e1968712bccc575ef37eda6403caa93c";
        }
        {
          name = "xml";
          publisher = "DotJoshJohnson";
          version = "2.5.0";
          sha256 =
            "8af1b6d2cb5d214592ba6a2a40595616a67111d56ceb05b3e17a38ec5e6f2eba";
        }
        {
          name = "php-debug";
          publisher = "felixfbecker";
          version = "1.13.0";
          sha256 =
            "46766c1271223e074388153e4c4f4621c4821ab5b3f911c6414eca1fb8681540";
        }
        {
          name = "php-intellisense";
          publisher = "felixfbecker";
          version = "2.3.13";
          sha256 =
            "6feb566fa25b3d3a7f3876c875cc90de549a2d4cfbc1ca644c2bc097a1cc34cc";
        }
        {
          name = "php-pack";
          publisher = "felixfbecker";
          version = "1.0.2";
          sha256 =
            "5e830bbaf2542b83508f325ee016298f8808f2a69bc6fb3a197cee9c96620bda";
        }
        {
          name = "vscode-firefox-debug";
          publisher = "firefox-devtools";
          version = "2.6.0";
          sha256 =
            "5f8456ca714038ee558c41f5cdba27fb6cb718af4019a296d19ac36e80661281";
        }
        {
          name = "code-runner";
          publisher = "formulahendry";
          version = "0.9.15";
          sha256 =
            "4db10d3cb91224e2e7d001ea1a6f530b380f159bf7f83441dad9086d1dfb88f9";
        }
        {
          name = "MagicPython";
          publisher = "magicstack";
          version = "1.1.0";
          sha256 =
            "db1afde459ded6592f73c65cc5eed9ae5e3f4c1fa7f9ac958e340a29b8fcfc23";
        }
        {
          name = "terraform";
          publisher = "mauve";
          version = "1.4.0";
          sha256 =
            "642c29cd24a83cc9b04df897d1486cc4f99c8530e7b1d04158aa20af54c76c2c";
        }
        {
          name = "vscode-docker";
          publisher = "ms-azuretools";
          version = "0.9.0";
          sha256 =
            "40ba2b7472c6926dea3f9fe9ada83121d1c55aaef10fd604c64ff6829f266a72";
        }
        {
          name = "vscode-kubernetes-tools";
          publisher = "ms-kubernetes-tools";
          version = "1.0.9";
          sha256 =
            "4659dec94c3037cbd55e3dd682f81a441ff425c1ef1f551f77e29ce5b04dc3d6";
        }
        {
          name = "python";
          publisher = "ms-python";
          version = "2019.11.50794";
          sha256 =
            "6a9edf9ecabed14aac424e6007858068204a3638bf3bb4f235bd6035d823acc6";
        }
        {
          name = "cpptools";
          publisher = "ms-vscode";
          version = "0.26.2";
          sha256 =
            "f17291d29e69364c37e983d3bdeceb73f70d178850268ac3904ea40aaa89eb11";
        }
        {
          name = "csharp";
          publisher = "ms-vscode";
          version = "1.21.9";
          sha256 =
            "d23991b62a21af228761fe406858482a42a0cf25ffae749d5a7c203ee1291693";
        }
        {
          name = "Go";
          publisher = "ms-vscode";
          version = "0.11.9";
          sha256 =
            "cd50fd7f01d6f31cdb66edf04d8d4e544a5f910d59ab6d7dc166fb43398756ba";
        }
        {
          name = "vscode-typescript-tslint-plugin";
          publisher = "ms-vscode";
          version = "1.2.3";
          sha256 =
            "ef6d44ca8c2976c360dd390d57783a30431003071155d7f339da692082056837";
        }
        {
          name = "java";
          publisher = "redhat";
          version = "0.54.2";
          sha256 =
            "fb8b3c94130d0f4dddb3455d9df4c2ea7907c490ab8b5330f69080cddb55708b";
        }
        {
          name = "vscode-yaml";
          publisher = "redhat";
          version = "0.6.1";
          sha256 =
            "7529e5a4314c815b7accbdacf771254c385ecde78aa4074da17d5388bb1c2e0d";
        }
        {
          name = "rust";
          publisher = "rust-lang";
          version = "0.7.0";
          sha256 =
            "40f3b9200e66ad8a3a727de17538e6ce16d137f614ec6e3232ca49f9d441c79a";
        }
        {
          name = "crates";
          publisher = "serayuzgur";
          version = "0.4.7";
          sha256 =
            "f46a53406c7a90ab95a2a1a757be170ce80d9380f4c9098fc0bd1f1f5be51ee5";
        }
        {
          name = "vscode-nginx";
          publisher = "shanoor";
          version = "0.6.0";
          sha256 =
            "1e3b517c6ebaf55ba766f17ada1543293873c307ae9fe7432c4b3373e5a50c0d";
        }
        {
          name = "vscodeintellicode";
          publisher = "VisualStudioExptTeam";
          version = "1.2.0";
          sha256 =
            "9707525b01c9f125ace2d34342b2e556adfe73e0e9978371093cd4194bc39eb5";
        }
        {
          name = "vscode-java-debug";
          publisher = "vscjava";
          version = "0.23.0";
          sha256 =
            "f98a35c8dd4f3079ecd9657b04f1edbfea04c364c0fbf7eee1285f942782710b";
        }
        {
          name = "vscode-java-dependency";
          publisher = "vscjava";
          version = "0.6.0";
          sha256 =
            "b6934e58b92b476476dde50adcc5358d9042cc4a81f8ff4f1f49857f5bb97766";
        }
        {
          name = "vscode-java-pack";
          publisher = "vscjava";
          version = "0.8.1";
          sha256 =
            "d965a77efcf44f687623ed56dd7fd14a194764515a5e57c2dfbd75d3d72a43f5";
        }
        {
          name = "vscode-java-test";
          publisher = "vscjava";
          version = "0.22.0";
          sha256 =
            "55b26732b217f972d8ceaa5fb5443cf3d8470a14ef64ed4f8cfe36434bb7efa1";
        }
        {
          name = "vscode-maven";
          publisher = "vscjava";
          version = "0.20.0";
          sha256 =
            "613084b6ddb1e2cc1635b9cd28b2f6a5bde99c0ea6199178c528ba3d81752555";
        }
        {
          name = "vscode-icons";
          publisher = "vscode-icons-team";
          version = "9.6.0";
          sha256 =
            "9577f431553e467fb3acbcda5177a66da98870a3888177839e6d46c243792e80";
        }
        {
          name = "vscode-ansible";
          publisher = "vscoss";
          version = "0.5.2";
          sha256 =
            "9d5f2b8d919cdae98733295cd9c95cd63b81ccd33dcdb0902465249398c32a64";
        }
        {
          name = "jinja";
          publisher = "wholroyd";
          version = "0.0.8";
          sha256 =
            "914dae308042847384efa9e903dbb509224230f1cad218ffdaf6ac553c7dc9d2";
        }
        {
          name = "markdown-all-in-one";
          publisher = "yzhang";
          version = "2.6.1";
          sha256 =
            "f30f473f8d9ab51d7048bdb9d1eaea6f786ed5f1b88303e1e945c10a637c41ea";
        }
      ];
    userSettings = {
      debug.enableAllHovers = true;
      debug.inlineValues = true;
      editor.cursorBlinking = "smooth";
      editor.cursorSmoothCaretAnimation = true;
      editor.cursorStyle = "block";
      editor.fontFamily = "'Fira Code', 'monospace', monospace";
      editor.fontLigatures = true;
      editor.formatOnPaste = true;
      editor.renderLineHighlight = "all";
      editor.renderWhitespace = "selection";
      editor.roundedSelection = false;
      editor.smoothScrolling = true;
      editor.tabSize = 2;
      files.enableTrash = false;
      files.insertFinalNewline = true;
      files.trimFinalNewlines = true;
      files.trimTrailingWhitespace = true;
      git.allowForcePush = true;
      git.autofetch = true;
      git.autoStash = true;
      git.confirmSync = false;
      git.detectSubmodulesLimit = 128;
      git.enableSmartCommit = true;
      git.fetchOnPull = true;
      git.rebaseWhenSync = true;
      git.showPushSuccessNotification = true;
      merge-conflict.autoNavigateNextConflict.enabled = true;
      scm.defaultViewMode = "tree";
      terminal.integrated.copyOnSelection = true;
      terminal.integrated.cursorBlinking = true;
      terminal.integrated.experimentalUseTitleEvent = true;
      terminal.integrated.scrollback = 100000;
      window.title = "\${dirty}\${activeEditorShort}\${separator}\${rootName}";
      window.titleBarStyle = "custom";
      workbench.iconTheme = "vscode-icons";
      workbench.tree.renderIndentGuides = "always";
    };
  };
}
