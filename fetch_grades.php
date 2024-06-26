<?php
$servername = "localhost:3306";
$username = "root";
$password = "12345678";
$dbname = "diemsinhvien";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$hocKyId = $_POST['idHocKy'];
$studentId = $_POST['idSinhVien'];

// Query to get idGPA from GPA table
$gpaQuery = "SELECT idGPA FROM GPA WHERE idSinhVien = $studentId AND idHocKy = $hocKyId";
$gpaResult = $conn->query($gpaQuery);

if ($gpaResult->num_rows > 0) {
    while ($gpaRow = $gpaResult->fetch_assoc()) {
        $idGPA = $gpaRow['idGPA'];

        // Query to get grades information from Diem table using idGPA
        $gradesQuery = "SELECT mh.MaMonHoc, mh.TenMonHoc, mh.SoTinChi, d.DiemChuyenCan, d.DiemGiuaKy, d.DiemCuoiKy, d.DanhGia, d.TongKetHocPhan, d.DiemChu
                        FROM Diem d
                        JOIN MonHoc mh ON d.idMonHoc = mh.idMonHoc
                        WHERE d.idGPA = $idGPA";

        $gradesResult = $conn->query($gradesQuery);

        if ($gradesResult->num_rows > 0) {
            while ($grade = $gradesResult->fetch_assoc()) {
                $evaluation = $grade['TongKetHocPhan'] > 4.0 ? 'DAT' : 'Khong DAT';
                echo "<tr>
                        <td>{$grade['MaMonHoc']}</td>
                        <td>{$grade['TenMonHoc']}</td>
                        <td>{$grade['SoTinChi']}</td>
                        <td>{$grade['DanhGia']}</td>
                        <td>{$grade['DiemChuyenCan']}</td>
                        <td>{$grade['DiemGiuaKy']}</td>
                        <td>{$grade['DiemCuoiKy']}</td>
                        <td>{$grade['TongKetHocPhan']}</td>
                        <td>{$grade['DiemChu']}</td>
                        <td>{$evaluation}</td>
                      </tr>";
            }
        } else {
            echo "<tr><td colspan='9'>No data found</td></tr>";
        }
    }
} else {
    echo "<tr><td colspan='9'>No data found</td></tr>";
}

$conn->close();
?>
