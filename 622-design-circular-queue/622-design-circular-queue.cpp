class MyCircularQueue {
public:
	int fPos, lPos;
	int* arr;
	int size;
	int curSize;
	MyCircularQueue(int k) {
		arr = new int [k];
		fPos = lPos = 0;
		size = k;
		curSize = 0;
	}

	bool enQueue(int value) {
		if(curSize == size) return 0;
		arr[lPos] = value;
		lPos = (lPos+1)%size;
		curSize++;
		return 1;
	}

	bool deQueue() {
		if(curSize == 0) return 0;
		fPos = (fPos+1)%size;
		curSize--;
		return 1;
	}

	int Front() {
		if(curSize == 0) return -1;
		return arr[fPos];
	}

	int Rear() {
		if(curSize == 0) return -1;
		if(lPos == 0) return arr[size-1];
		return arr[lPos-1];
	}

	bool isEmpty() {
		return curSize == 0;
	}

	bool isFull() {
		return curSize == size;
	}
};