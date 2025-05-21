package utils;

public class MyStack {
    private String[] elements;
    private int top;
    private int capacity;

    public MyStack(int capacity) {
        this.capacity = capacity;
        elements = new String[capacity];
        top = -1;
    }

    public void push(String item) {
        if (top == capacity - 1) {
            // resize array if needed or throw exception
            throw new RuntimeException("Stack overflow");
        }
        elements[++top] = item;
    }

    public String pop() {
        if (isEmpty()) {
            return null;  // or throw exception
        }
        return elements[top--];
    }

    public boolean isEmpty() {
        return top == -1;
    }

    public int size() {
        return top + 1;
    }
    // using jsp to peek,, cause that will more organized for our porject
    public String peek() {
        if (isEmpty()) return null;
        return elements[top];
    }
    // For future -- like clicking the movie to view details likewise, but not implemented now.
    public String get(int index) {
        if (index < 0 || index > top) return null;
        return elements[index];
    }

}
