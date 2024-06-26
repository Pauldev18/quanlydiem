-- Create the database
CREATE DATABASE diemsinhvien;

-- Switch to the diemsinhvien database
USE diemsinhvien;

-- Create the HocKy table
CREATE TABLE HocKy (
    idHocKy INT PRIMARY KEY AUTO_INCREMENT,
    TenHocKy VARCHAR(100),
    NamHoc INT
);

-- Create the Khoa table
CREATE TABLE Khoa (
    idKhoa INT PRIMARY KEY AUTO_INCREMENT,
    MaKhoa VARCHAR(50),
    TenKhoa VARCHAR(100)
);

-- Create the GiangVien table
CREATE TABLE GiangVien (
    idGiangVien INT PRIMARY KEY AUTO_INCREMENT,
    MaGiangVien VARCHAR(50),
    HoTen VARCHAR(100),
    NgaySinh DATE,
    DiaChi VARCHAR(255),
    Email VARCHAR(100),
    DienThoai VARCHAR(20),
    TrinhDoHV VARCHAR(50),
    ChuyenMon VARCHAR(100),
    NgayBatDauLamViec DATE
);

-- Create the HeDaoTao table
CREATE TABLE HeDaoTao (
    idHeDT INT PRIMARY KEY AUTO_INCREMENT,
    MaHeDT VARCHAR(50),
    TenHeDT VARCHAR(100)
);

-- Create the Lop table
CREATE TABLE Lop (
    idLop INT PRIMARY KEY AUTO_INCREMENT,
    MaLop VARCHAR(50),
    TenLop VARCHAR(100),
    idKhoa INT,
    idHeDT INT,
    idGiangVien INT,
    FOREIGN KEY (idKhoa) REFERENCES Khoa(idKhoa),
    FOREIGN KEY (idGiangVien) REFERENCES GiangVien(idGiangVien),
    FOREIGN KEY (idHeDT) REFERENCES HeDaoTao(idHeDT)
);

-- Create the SinhVien table
CREATE TABLE SinhVien (
    idSinhVien INT PRIMARY KEY AUTO_INCREMENT,
    MaSinhVien VARCHAR(50),
    HoTen VARCHAR(100),
    NgaySinh DATE,
    DiaChi VARCHAR(255),
    Email VARCHAR(100),
    DienThoai VARCHAR(20),
    idLop INT,
    FOREIGN KEY (idLop) REFERENCES Lop(idLop)
);

-- Create the MonHoc table
CREATE TABLE MonHoc (
    idMonHoc INT PRIMARY KEY AUTO_INCREMENT,
    MaMonHoc VARCHAR(50),
    TenMonHoc VARCHAR(100),
    SoTinChi INT,
    MoTa TEXT,
    idHocKy INT,
    FOREIGN KEY (idHocKy) REFERENCES HocKy(idHocKy)
);
CREATE TABLE GPA (
    idGPA INT PRIMARY KEY AUTO_INCREMENT,
    idSinhVien INT,
    idHocKy INT,
    GPA FLOAT,
    FOREIGN KEY (idSinhVien) REFERENCES SinhVien(idSinhVien),
    FOREIGN KEY (idHocKy) REFERENCES HocKy(idHocKy)
);
-- Create the Diem table
CREATE TABLE Diem (
    idDiem INT PRIMARY KEY AUTO_INCREMENT,
    idSinhVien INT,
    idMonHoc INT,
    HocKy VARCHAR(20),
    NamHoc INT,
    DiemChuyenCan FLOAT,
    DiemGiuaKy FLOAT,
    DiemCuoiKy FLOAT,
    TongKetHocPhan FLOAT,
    DiemChu VARCHAR(20),
    DanhGia VARCHAR(20),
    idGPA int,
    foreign key(idGPA) references GPA(idGPA),
    FOREIGN KEY (idSinhVien) REFERENCES SinhVien(idSinhVien),
    FOREIGN KEY (idMonHoc) REFERENCES MonHoc(idMonHoc)
);

-- Create the GPA table


-- Create the NguoiDung table
CREATE TABLE NguoiDung (
    idNguoiDung INT PRIMARY KEY AUTO_INCREMENT,
    TenDangNhap VARCHAR(50),
    MatKhau VARCHAR(100),
    VaiTro ENUM('admin', 'giao_vien', 'sinh_vien', 'khac')
);

-- Insert data into HocKy table
INSERT INTO HocKy (TenHocKy, NamHoc) VALUES
('Hoc Ky 1', 2023),
('Hoc Ky 2', 2023),
('Hoc Ky 3', 2024),
('Hoc Ky 4', 2024),
('Hoc Ky 5', 2025);

-- Insert data into Khoa table
INSERT INTO Khoa (MaKhoa, TenKhoa) VALUES
('K01', 'Khoa Toan'),
('K02', 'Khoa Ly'),
('K03', 'Khoa Hoa'),
('K04', 'Khoa Sinh'),
('K05', 'Khoa Tin');

-- Insert data into GiangVien table
INSERT INTO GiangVien (MaGiangVien, HoTen, NgaySinh, DiaChi, Email, DienThoai, TrinhDoHV, ChuyenMon, NgayBatDauLamViec) VALUES
('GV01', 'Nguyen Van A', '1980-01-01', '123 Main St', 'nguyenvana@example.com', '0123456789', 'Thac sy', 'Toan', '2005-09-01'),
('GV02', 'Tran Thi B', '1981-02-02', '456 Elm St', 'tranthib@example.com', '0123456788', 'Tien sy', 'Ly', '2006-09-01'),
('GV03', 'Le Van C', '1982-03-03', '789 Oak St', 'levanc@example.com', '0123456787', 'Thac sy', 'Hoa', '2007-09-01'),
('GV04', 'Pham Thi D', '1983-04-04', '101 Maple St', 'phamthid@example.com', '0123456786', 'Cu nhan', 'Sinh', '2008-09-01'),
('GV05', 'Hoang Van E', '1984-05-05', '202 Pine St', 'hoangvane@example.com', '0123456785', 'Thac sy', 'Tin', '2009-09-01');

-- Insert data into HeDaoTao table
INSERT INTO HeDaoTao (MaHeDT, TenHeDT) VALUES
('HDT01', 'Dai hoc'),
('HDT02', 'Cao dang'),
('HDT03', 'Trung cap'),
('HDT04', 'Lien ket Quoc te'),
('HDT05', 'Khac');

-- Insert data into Lop table
INSERT INTO Lop (MaLop, TenLop, idKhoa, idHeDT, idGiangVien) VALUES
('L01', 'Lop Toan 1', 1, 1, 1),
('L02', 'Lop Ly 1', 2, 2, 2),
('L03', 'Lop Hoa 1', 3, 3, 3),
('L04', 'Lop Sinh 1', 4, 4, 4),
('L05', 'Lop Tin 1', 5, 5, 5);

-- Insert data into SinhVien table
INSERT INTO SinhVien (MaSinhVien, HoTen, NgaySinh, DiaChi, Email, DienThoai, idLop) VALUES
('SV01', 'Nguyen Van F', '2000-01-01', '123 Main St', 'nguyenvanf@example.com', '0123456784', 1),
('SV02', 'Tran Thi G', '2000-02-02', '456 Elm St', 'tranthig@example.com', '0123456783', 2),
('SV03', 'Le Van H', '2000-03-03', '789 Oak St', 'levanh@example.com', '0123456782', 3),
('SV04', 'Pham Thi I', '2000-04-04', '101 Maple St', 'phamthii@example.com', '0123456781', 4),
('SV05', 'Hoang Van J', '2000-05-05', '202 Pine St', 'hoangvanj@example.com', '0123456780', 5);

-- Insert data into MonHoc table
INSERT INTO MonHoc (MaMonHoc, TenMonHoc, SoTinChi, MoTa, idHocKy) VALUES
('MH01', 'Toan Cao Cap', 3, 'Mon Toan nang cao', 1),
('MH02', 'Ly Thuyet', 2, 'Mon Ly thuyet', 2),
-- Insert data into MonHoc table (continued)
('MH03', 'Hoa Phan Tich', 3, 'Mon Hoa hoc phan tich', 3),
('MH04', 'Sinh Hoc Phan Tu', 4, 'Mon Sinh hoc phan tu', 4),
('MH05', 'Lap Trinh C', 3, 'Mon Lap trinh C', 5);

-- Insert data into GPA table
INSERT INTO GPA (idSinhVien, idHocKy, GPA) VALUES
(1, 1, 3.5),
(2, 2, 3.7),
(3, 3, 3.6),
(4, 4, 3.8),
(5, 5, 3.9);

-- Insert data into Diem table
INSERT INTO Diem (idSinhVien, idMonHoc, HocKy, NamHoc, DiemChuyenCan, DiemGiuaKy, DiemCuoiKy, TongKetHocPhan, DiemChu, DanhGia, idGPA) VALUES
(1, 1, 'Hoc Ky 1', 2023, 8.5, 7.5, 9.0, 8.5, 'A', 'Tot', 1),
(2, 2, 'Hoc Ky 2', 2023, 8.0, 7.0, 8.5, 7.8, 'B+', 'Kha', 2),
(3, 3, 'Hoc Ky 3', 2024, 9.0, 8.0, 9.5, 8.8, 'A', 'Tot', 3),
(4, 4, 'Hoc Ky 4', 2024, 7.5, 7.0, 8.0, 7.5, 'B', 'Kha', 4),
(5, 5, 'Hoc Ky 5', 2025, 8.5, 9.0, 9.5, 9.0, 'A', 'Tot', 5);

-- Insert data into NguoiDung table
INSERT INTO NguoiDung (TenDangNhap, MatKhau, VaiTro) VALUES
('admin1', 'password1', 'admin'),
('gv01', 'password2', 'giao_vien'),
('gv02', 'password3', 'giao_vien'),
('sv01', 'password4', 'sinh_vien'),
('sv02', 'password5', 'sinh_vien');