#!/bin/sh

# Install equivs
apt-get update && apt-get install -y equivs

# Create a control file for the dummy package
cat <<EOF > postgresql-16-control
Section: misc
Priority: optional
Standards-Version: 3.9.2

Package: postgresql-16
Version: 1.0
Maintainer: Your Name <your_email@example.com>
Architecture: all
Description: Dummy package for PostgreSQL 16
EOF

# Generate the package
equivs-build postgresql-16-control

# Install the generated package
dpkg -i postgresql-16_1.0_all.deb

# Clean up
rm postgres-16-control postgresql-16_1.0_all.deb

# Remove equivs
apt-get purge -y equivs
apt-get autoremove -y
