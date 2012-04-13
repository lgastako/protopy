#!/usr/bin/env python

import glob
import setuptools
from distutils.core import setup


setup(name="{{PROJECT_NAME}}",
      version="0.0.1",
      description="Python Distribution Utilities",
      author="John Evans",
      author_email="lgastako@gmail.com",
      url="https://github.com/lgastako/{{PROJECT_NAME}}",
      package_dir={"":"lib"},
      scripts=glob.glob("scripts/*"))
