{ ... }:
let
myShellAliases = {
    RestartSound = "systemctl restart --user wireplumber";
};
in
{
    environment.shellAliases = myShellAliases;
}
