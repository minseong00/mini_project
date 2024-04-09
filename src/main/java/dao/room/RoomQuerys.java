package dao.room;

public interface RoomQuerys {
	String roomCount = "select count(roomNo) as total from room";
	String selectAll = "select * from room";
	String selectOne = "select from room where roomNo = ?";
	String deleteOne = "delete from room where roomNo = ?";
	String insertData = "insert into room (roomName, roomType, roomDetail, headCount, roomCost) "
			+ "values (?, ?, ?, ?, ?)";
	String insertImg = "insert into roomImg (img1, img2, img3, img4, img5, infoImg) "
			+ "values (?, ?, ?, ?, ?, ?)";
}
