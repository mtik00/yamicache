#!/usr/bin/env bash
set -euo pipefail

rm -f dist/*
rm -rf .mypy-stubs

stubgen yamicache -o .mypy-stubs
cp ./.mypy-stubs/yamicache/*.pyi yamicache/
touch yamicache/py.typed

poetry build

rm -f yamicache/*.pyi yamicache/py.typed
