{ pkgs, ... }:
{
  # Settings
  home-manager.users.giacomo.programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix # Nix language support
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # curl -L "https://${EXT_AUTHOR}.gallery.vsassets.io/_apis/public/gallery/publisher/${EXT_AUTHOR}/extension/${EXT_NAME}/${EXT_VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage" | sha256sum | awk '{ print $1 }'
      {
        name = "vscode-icons";
        publisher = "vscode-icons-team";
        version = "9.6.0";
        sha256 = "9577f431553e467fb3acbcda5177a66da98870a3888177839e6d46c243792e80";
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
