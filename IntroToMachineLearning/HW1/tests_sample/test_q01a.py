import unittest
from hw1 import prime_nums_reversed


class TestQ01A(unittest.TestCase):
    def setUp(self):
        pass
    
    def test_nums_one(self):
        """Evaluate prime_nums_reversed(1)"""
        self.assertEqual(prime_nums_reversed(1), '')
