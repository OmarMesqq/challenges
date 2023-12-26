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


stack = Stack()
for i in range(6):
    line = "***********"
    
    if i == 0: stack.push(line)
    else: 
        stars = 11 - (2*i)
        newLine = i * " " + "*" * stars + i * " " 
        stack.push(newLine)


for i in range(6): print(stack.pop())
