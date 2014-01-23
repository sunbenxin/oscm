from distutils.core import setup
#from setuptools import setup

readme = open('../README.md').read()
changes = open('../CHANGES.txt').read()
#version_file = 'oscm.py'
#version = re.findall("__version__ = '(.*)'", open(version_file).read())[0]
#try:
#    version = __import__('utile').git_version(version)
#except ImportError:
#    pass

setup(
    name='oscm',
    version='0.1.0',
    description="Collection of useful functions and classes",
    long_description=readme + '\n\n' + changes,
    keywords='oscm',
    author='Neo Chen',
    author_email='netkiller@msn.com',
    url='http://netkiller.github.io',
    license='BSD',
    py_modules=['rsync','whiptail'],
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3.3',
    ],
)

