package javaResources;

public class Room {
	private int roomId;
	private int capacity;
	private boolean tv;
	private boolean projector;

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public boolean isTv() {
		return tv;
	}

	public void setTv(boolean tv) {
		this.tv = tv;
	}

	public boolean isProjector() {
		return projector;
	}

	public void setProjector(boolean projector) {
		this.projector = projector;
	}

	public Room(int roomId, int capacity, boolean tv, boolean projector) {
		super();
		this.roomId = roomId;
		this.capacity = capacity;
		this.tv = tv;
		this.projector = projector;
	}

	@Override
	public String toString() {
		if (tv == false && projector == true) {
			return "Room " + roomId + " has capacity of " + capacity
					+ " places; There is NO TV, but there is projector!";
		} else if (tv == true && projector == false) {
			return "Room " + roomId + " has capacity of " + capacity
					+ " places; Trere is TV, but there is NO projector!";
		} else if (tv == false && projector == false) {
			return "Room " + roomId + " has capacity of " + capacity + " places; Trere is NO TV and NO projector!";
		} else {
			return "Room " + roomId + " has capacity of " + capacity + " places; Trere is  TV and projector!";
		}
	}

}
