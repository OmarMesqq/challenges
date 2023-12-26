class Stack:
    def __init__(self): 
        self.stack = []
    def push(self, element):
        self.stack.append(element)
    def pop(self):
        if not self.is_empty():
            topIndex = len(self.stack) - 1
            topElement = self.stack[topIndex]
            del self.stack[topIndex]
            return topElement
        else: return None
    def is_empty(self):
        return len(self.stack) == 0

def getBaselineSize(tree_height):
    return 1 + (tree_height - 1) * 2

stack = Stack()
tree_height = 12
baseline = getBaselineSize(tree_height)
for i in range(tree_height):
    line = "*" * baseline
    
    if i == 0: stack.push(line)
    else: 
        stars = baseline - (2*i)
        newLine = i * " " + "*" * stars + i * " " 
        stack.push(newLine)


for i in range(tree_height): print(stack.pop())
