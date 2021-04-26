''' Sample module. Document it as such to help the next developers and please pylint. '''

class SampleClass:
    ''' Sample class. Document it as such to help the next developers and please pylint. '''
    def __init__(self, name):
        self._name = name

    def hello(self):
        ''' Return a string to greet the entity provided at construction time. '''
        return 'Hello, %s!' % self._name


def main():
    ''' Greet Python. '''
    hi_python = SampleClass('Python')
    print(hi_python.hello())


if __name__ == '__main__':
    main()
