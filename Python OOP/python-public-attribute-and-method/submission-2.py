class StoreItem:
    def __init__(self, name, price):
        self.name = name
        self.price = price
    
    def display_item(self):
        print(self.name)
        print(self.price)


chips = StoreItem("Chips", 1.99) # Don't modify this line
chips.display_item()
# TODO: Access the attributes of the chips object and display them


