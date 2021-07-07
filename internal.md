
Upgrade:
- Download the package and build the checksum


    wget https://github.com/eclipse/eclipsefuro/archive/v1.27.0.tar.gz
    shasum -a 256 v1.27.0.tar.gz

- Update the rb file with package and checksum


    url "https://github.com/theNorstroem/spectools/archive/v1.11.1.tar.gz"
    sha256 "5f9cde1c9243f8e199abf6951c58abb40cbbba8a8cbebe449c7d44f0c6f63809"

- Commit and push