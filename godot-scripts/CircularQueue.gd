class_name CircularQueue

var capacity: int
var front_idx: int = -1
var back_idx: int = -1

var arr: Array[Variant]

func _init(max_size: int):
	capacity = max_size

	for i in range(capacity):
		arr.append(null)

func append(value: Variant):
	if capacity == 0:
		return

	if arr.is_empty():
		front_idx = 0
		back_idx = 0
	elif back_idx >= front_idx:
		# [f, ..., b, ...]
		back_idx = (back_idx + 1) % self.capacity
	elif back_idx < front_idx:
		# [..., b, f, ...]
		front_idx = (front_idx + 1) % self.capacity
		back_idx = (back_idx + 1) % self.capacity

	arr[back_idx] = value

func back() -> Variant:
	if back_idx == -1:
		return null
	return arr[back_idx]