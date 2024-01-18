#!/bin/bash

firefox $(grep '://' 'release/urls') >/dev/null 2>/dev/null &
