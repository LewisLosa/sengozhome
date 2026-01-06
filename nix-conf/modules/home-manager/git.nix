{vars, ...}: {
  home = {
    # inspo: https://jeppesen.io/git-commit-sign-nix-home-manager-ssh/
    file.".ssh/allowed_signers".text = "* ${vars.sshPublicKey}";
  };

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          inherit (vars) fullName email;
          signingkey = vars.sshPublicKey;
        };

        commit.gpgsign = true;
        gpg.format = "ssh";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };
    };
  };
}
