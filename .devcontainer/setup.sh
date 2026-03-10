#!/bin/bash
set -e

cd /workspaces/typo314

ddev config --project-type=typo3 --docroot=public --php-version 8.4
ddev start
ddev composer create-project "typo3/cms-base-distribution:^14"
ddev typo3 setup \
  --server-type=other \
  --driver=mysqli \
  --host=db \
  --port=3306 \
  --dbname=db \
  --username=db \
  --password=db \
  --admin-username=admin \
  --admin-user-password="Admin1234*" \
  --admin-email=admin@example.com \
  --project-name="TYPO3 14 Test" \
  --create-site
