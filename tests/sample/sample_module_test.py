from unittest.mock import patch
from unittest2 import TestCase, main
from hello_python.sample_module import SampleClass, main as sample_main
from six import StringIO


class SampleClassTest(TestCase):
    def test_hello_should_return_hello_python(self):
        hi_python = SampleClass('Python')
        self.assertEquals(hi_python.hello(), 'Hello, Python!')

    @patch('sys.stdout', new_callable=StringIO)
    def test_main_should_print_hello_python(self, mock_stdout):
        sample_main()
        self.assertEquals(mock_stdout.getvalue().strip(), 'Hello, Python!')


if __name__ == '__main__':
    main()
