idrisPackages:

with idrisPackages;

idrisPackages // {
  lightyear = callPackage ./lightyear { };
  # testing = callPackage ./testing { };
  # containers = callPackage ./containers { };
}
