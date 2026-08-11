class TextProcessor:
    # Implement method overloading for format_text method
    def format_text(self, text1, text2=""):
        if text2 != "":
            return text1 + text2
        else:
            return text1.upper()




# Don't modify the code below
processor = TextProcessor()
print(processor.format_text("hello"))
print(processor.format_text("hello", "world"))
