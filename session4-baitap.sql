create database  QUANLY_BANHANG;
use  QUANLY_BANHANG;

create table khachhang(
makh varchar(5) primary key,
tenkh varchar(30),
diachi varchar(50),
ngaysinh datetime,
sodt varchar(15)
);

create table nhanvien(
manv varchar(5) primary key,
hoten varchar(30),
diachi bit,
ngaysinh datetime,
dienthoai varchar(50),
dt  varchar(15),
email text,
noisinh varchar(20),
ngaybilua datetime,
manql varchar(4)
);

create table nhacungcap(
mancc varchar(6) primary key,
tenncc varchar(50),
diachi varchar(50),
dt varchar(15),
email varchar(30),
web varchar(30)
);

create table loaisp (
malsp varchar(6) primary key,
tenlsp varchar(30),
ghichu varchar(100)
);

create table sanpham(
masp varchar(5) primary key,
mlsp varchar(6),
tensp varchar(50),
donvitinh varchar(10),
gichu varchar(100),
foreign key(mlsp) references loaisp(malsp)
);

create table phieunhap(
sopn varchar(5) primary key,
manvs varchar(5),
manccs varchar(6),
ngaynhap datetime,
ghichu varchar(100),
foreign key(manvs) references nhanvien(manv),
foreign key(manccs) references nhacungcap(mancc)
);

create table ctphieunhap(
masps varchar(5),
sopns varchar(5),
soluong smallint,
gianhap real,
foreign key(masps) references sanpham(masp),
foreign key(sopns) references phieunhap(sopn),
primary key (masps,sopns)
);

create table phieuxuat (
sopx varchar(5) primary key,
manvs varchar(5),
makhs varchar(5),
ngayban datetime,
ghichu text,
foreign key(manvs) references nhanvien(manv),
foreign key(makhs) references khachhang(makh)
);

create table ctphieuxuat (
spx varchar(5),
msp varchar(5),
sl smallint,
giaban real,
foreign key(spx) references phieuxuat(sopx),
foreign key(msp) references sanpham(masp),
primary key (spx,msp)
);

INSERT INTO khachhang (makh, tenkh, diachi, ngaysinh, sodt)
VALUES 
    ('KH001', 'Nguyen Van A', '123 ABC Street', '1990-01-01', '0123456789'),
    ('KH002', 'Tran Thi B', '456 XYZ Road', '1995-05-05', '0987654321'),
    ('KH003', 'Le Van C', '789 PQR Avenue', '1988-12-15', '0345678901'),
    ('KH004', 'Pham Thi D', '111 DEF Lane', '1992-09-30', '0765432109'),
    ('KH005', 'Hoang Van E', '222 HIJ Drive', '1985-06-20', '0234567890'),
    ('KH006', 'Nguyen Thi F', '333 LMN Circle', '1998-03-25', '0567890123'),
    ('KH007', 'Tran Van G', '444 STU Boulevard', '1991-11-10', '0876543210'),
    ('KH008', 'Le Thi H', '555 VWX Street', '1987-04-12', '0654321098'),
    ('KH009', 'Pham Van I', '666 YZK Road', '1996-08-28', '0456789012'),
    ('KH010', 'Hoang Thi J', '777 XYZ Avenue', '1993-07-05', '0890123456');
INSERT INTO nhanvien (manv, hoten, diachi, ngaysinh, dienthoai, dt, email, noisinh, ngaybilua, manql)
VALUES 
    ('NV001', 'Nguyen Van An', 1, '1985-03-10', '0123456789', '0123456789', 'an@company.com', 'Hanoi', '2020-01-01', NULL),
    ('NV002', 'Tran Thi Binh', 0, '1990-08-15', '0987654321', '0987654321', 'binh@company.com', 'Ho Chi Minh City', '2019-12-31', NULL),
    ('NV003', 'Le Van Cuong', 1, '1988-05-20', '0345678901', '0345678901', 'cuong@company.com', 'Da Nang', '2021-03-25', 'NV01'),
    ('NV004', 'Pham Thi Dung', 0, '1993-11-25', '0765432109', '0765432109', 'dung@company.com', 'Hue', '2022-05-15', 'NV02'),
    ('NV005', 'Hoang Van Eo', 1, '1996-06-30', '0234567890', '0234567890', 'eo@company.com', 'Quang Ninh', '2023-07-01', 'NV01'),
    ('NV006', 'Nguyen Thi Fong', 0, '1987-04-05', '0567890123', '0567890123', 'fong@company.com', 'Binh Dinh', '2022-09-10', 'NV03'),
    ('NV007', 'Tran Van Gia', 1, '1995-02-15', '0876543210', '0876543210', 'gia@company.com', 'Ha Tinh', '2023-01-05', 'NV04'),
    ('NV008', 'Le Thi Hoa', 0, '1989-09-20', '0654321098', '0654321098', 'hoa@company.com', 'Quang Nam', '2022-07-12', 'NV02'),
    ('NV009', 'Pham Van I', 1, '1992-12-12', '0456789012', '0456789012', 'i@company.com', 'Dak Lak', '2021-11-30', 'NV03'),
    ('NV010', 'Hoang Thi Kim', 0, '1997-07-22', '0890123456', '0890123456', 'kim@company.com', 'Can Tho', '2023-02-28', 'NV07');
INSERT INTO nhacungcap (mancc, tenncc, diachi, dt, email, web)
VALUES 
    ('NCC001', 'Công ty A', '123 Supplier Street', '0123456789', 'info@companya.com', 'www.companya.com'),
    ('NCC002', 'Công ty B', '456 Provider Road', '0987654321', 'info@companyb.com', 'www.companyb.com'),
    ('NCC003', 'Công ty C', '789 Distributor Avenue', '0345678901', 'info@companyc.com', 'www.companyc.com'),
    ('NCC004', 'Công ty D', '111 Wholesaler Lane', '0765432109', 'info@companyd.com', 'www.companyd.com'),
    ('NCC005', 'Công ty E', '222 Exporter Drive', '0234567890', 'info@companye.com', 'www.companye.com'),
    ('NCC006', 'Công ty F', '333 Importer Circle', '0567890123', 'info@companyf.com', 'www.companyf.com'),
    ('NCC007', 'Công ty G', '444 Manufacturer Boulevard', '0876543210', 'info@companyg.com', 'www.companyg.com'),
    ('NCC008', 'Công ty H', '555 Retailer Street', '0654321098', 'info@companyh.com', 'www.companyh.com'),
    ('NCC009', 'Công ty I', '666 Supplier Road', '0456789012', 'info@companyi.com', 'www.companyi.com'),
    ('NCC010', 'Công ty J', '777 Provider Avenue', '0890123456', 'info@companyj.com', 'www.companyj.com');

INSERT INTO loaisp (malsp, tenlsp, ghichu)
VALUES 
    ('LSP001', 'Điện thoại', 'Các loại điện thoại'),
    ('LSP002', 'Máy tính', 'Các loại máy tính'),
    ('LSP003', 'Máy ảnh', 'Các loại máy ảnh'),
    ('LSP004', 'Tivi', 'Các loại tivi'),
    ('LSP005', 'Tủ lạnh', 'Các loại tủ lạnh'),
    ('LSP006', 'Máy giặt', 'Các loại máy giặt'),
    ('LSP007', 'Điều hòa', 'Các loại điều hòa'),
    ('LSP008', 'Laptop', 'Các loại laptop'),
    ('LSP009', 'Thiết bị âm thanh', 'Các loại thiết bị âm thanh'),
    ('LSP010', 'Phụ kiện điện tử', 'Các loại phụ kiện điện tử');

INSERT INTO sanpham (masp, mlsp, tensp, donvitinh, gichu)
VALUES 
    ('SP001', 'LSP001', 'Điện thoại A', 'Cái', 'Điện thoại thương hiệu A'),
    ('SP002', 'LSP002', 'Laptop B', 'Cái', 'Laptop thương hiệu B'),
    ('SP003', 'LSP003', 'Máy ảnh C', 'Cái', 'Máy ảnh thương hiệu C'),
    ('SP004', 'LSP004', 'Tivi D', 'Cái', 'Tivi thương hiệu D'),
    ('SP005', 'LSP005', 'Tủ lạnh E', 'Cái', 'Tủ lạnh thương hiệu E'),
    ('SP006', 'LSP006', 'Máy giặt F', 'Cái', 'Máy giặt thương hiệu F'),
    ('SP007', 'LSP007', 'Điều hòa G', 'Cái', 'Điều hòa thương hiệu G'),
    ('SP008', 'LSP008', 'Laptop H', 'Cái', 'Laptop thương hiệu H'),
    ('SP009', 'LSP009', 'Loa bluetooth I', 'Cái', 'Loa bluetooth thương hiệu I'),
    ('SP010', 'LSP010', 'Ốp lưng điện thoại', 'Cái', 'Ốp lưng cho điện thoại');


INSERT INTO phieunhap (sopn, manvs, manccs, ngaynhap, ghichu)
VALUES 
    ('PN001', 'NV001', 'NCC001', '2023-01-10', 'Phiếu nhập số 1'),
    ('PN002', 'NV002', 'NCC002', '2023-02-15', 'Phiếu nhập số 2'),
    ('PN003', 'NV003', 'NCC003', '2023-03-20', 'Phiếu nhập số 3'),
    ('PN004', 'NV004', 'NCC004', '2023-04-25', 'Phiếu nhập số 4'),
    ('PN005', 'NV005', 'NCC005', '2023-05-30', 'Phiếu nhập số 5'),
    ('PN006', 'NV006', 'NCC006', '2023-06-05', 'Phiếu nhập số 6'),
    ('PN007', 'NV007', 'NCC007', '2023-07-10', 'Phiếu nhập số 7'),
    ('PN008', 'NV008', 'NCC008', '2023-08-15', 'Phiếu nhập số 8'),
    ('PN009', 'NV009', 'NCC009', '2023-09-20', 'Phiếu nhập số 9'),
    ('PN010', 'NV010', 'NCC010', '2023-10-25', 'Phiếu nhập số 10');


INSERT INTO ctphieunhap (masps, sopns, soluong, gianhap)
VALUES 
    ('SP001', 'PN001', 5, 5000000),
    ('SP002', 'PN001', 3, 15000000),
    ('SP003', 'PN002', 2, 8000000),
    ('SP004', 'PN002', 1, 12000000),
    ('SP005', 'PN003', 4, 6000000),
    ('SP006', 'PN003', 2, 7000000),
    ('SP007', 'PN004', 3, 9000000),
    ('SP008', 'PN004', 5, 17000000),
    ('SP009', 'PN005', 6, 3000000),
    ('SP010', 'PN005', 10, 2000000);

INSERT INTO phieuxuat (sopx, manvs, makhs, ngayban, ghichu)
VALUES 
    ('PX001', 'NV001', 'KH001', '2023-01-20', 'Phiếu xuất số 1'),
    ('PX002', 'NV002', 'KH002', '2023-02-25', 'Phiếu xuất số 2'),
    ('PX003', 'NV003', 'KH003', '2023-03-30', 'Phiếu xuất số 3'),
    ('PX004', 'NV004', 'KH004', '2023-04-05', 'Phiếu xuất số 4'),
    ('PX005', 'NV005', 'KH005', '2023-05-10', 'Phiếu xuất số 5'),
    ('PX006', 'NV006', 'KH006', '2023-06-15', 'Phiếu xuất số 6'),
    ('PX007', 'NV007', 'KH007', '2023-07-20', 'Phiếu xuất số 7'),
    ('PX008', 'NV008', 'KH008', '2023-08-25', 'Phiếu xuất số 8'),
    ('PX009', 'NV009', 'KH009', '2023-09-30', 'Phiếu xuất số 9'),
    ('PX010', 'NV010', 'KH010', '2023-10-05', 'Phiếu xuất số 10');


INSERT INTO ctphieuxuat (spx, msp, sl, giaban)
VALUES 
    ('PX001', 'SP001', 2, 7000000),
    ('PX001', 'SP002', 1, 12000000),
    ('PX002', 'SP002', 2, 14000000),
    ('PX003', 'SP003', 3, 8500000),
    ('PX004', 'SP004', 1, 15000000),
    ('PX005', 'SP005', 2, 6500000),
    ('PX005', 'SP006', 1, 7500000),
    ('PX006', 'SP006', 2, 8000000),
    ('PX007', 'SP007', 1, 10000000),
    ('PX008', 'SP008', 3, 18000000);



-- 1.	Truy vấn tất cả thông tin về các khách hàng trong bảng khachhang.
select * from khachhang;

-- 2.	Truy vấn tên và địa chỉ của nhà cung cấp trong bảng nhacungcap.
select tenncc,diachi from nhacungcap;

-- 3.	Truy vấn thông tin về tất cả nhân viên trong bảng nhanvien.
select * from nhanvien;

-- 4.	Truy vấn tên sản phẩm, tên loại sản phẩm và giá bán của các sản phẩm trong bảng sanpham.
select sp.tensp,lsp.tenlsp,ctpx.giaban from ctphieuxuat ctpx 
join sanpham sp on ctpx.msp = sp.masp
join loaisp lsp on sp.mlsp = lsp.malsp;

-- 5.	Truy vấn tên loại sản phẩm và số lượng sản phẩm thuộc loại đó trong bảng sanpham.
select lsp.tenlsp,count(sp.masp) from loaisp lsp 
join sanpham sp on sp.mlsp = lsp.malsp
join ctphieunhap ctpn on sp.masp = ctpn.masps
group by lsp.malsp;

-- 6.	Truy vấn tên loại sản phẩm và số lượng sản phẩm thuộc loại đó, sắp xếp kết quả theo số lượng giảm dần.
select lsp.tenlsp,count(sp.masp) soluong from loaisp lsp 
join sanpham sp on sp.mlsp = lsp.malsp
join ctphieunhap ctpn on sp.masp = ctpn.masps
group by lsp.malsp
order by soluong desc;

-- 7.	Truy vấn tên nhân viên và tên khách hàng của tất cả các phiếu xuất trong bảng phieuxuat.
select nv.hoten,kh.tenkh from phieuxuat px
join khachhang kh on px.makhs = kh.makh
join nhanvien nv on px.manvs = nv.manv;

-- 8.	Truy vấn số lượng và giá bán của sản phẩm trong các phiếu xuất có mã số là 'PX002'.
select sl,giaban from ctphieuxuat where sopx like "PX002";

-- 9.	Truy vấn thông tin về các sản phẩm có giá bán lớn hơn hoặc bằng 10 triệu đồng.
select * from sanpham sp 
join ctphieuxuat ctpx on sp.masp = ctpx.msp
where ctpx.giaban >= 10000000;

-- 10.	Truy vấn thông tin về các sản phẩm có giá bán nằm trong khoảng từ 5 triệu đến 15 triệu đồng.
select * from sanpham sp 
join ctphieuxuat ctpx on sp.masp = ctpx.msp
where ctpx.giaban between 5000000 and 15000000;

-- 11.	Truy vấn tất cả các phiếu nhập và ngày nhập hàng của nhà cung cấp có mã số 'NCC003'.
select * from phieunhap where manccs like "NCC03";

-- 12.	Truy vấn tên sản phẩm và số lượng tồn kho (số lượng trong bảng ctphieuxuat trừ đi số lượng trong bảng ctphieunhap) của từng sản phẩm.
select sp.tensp,(ctpn.soluong - ctpx.sl) `tồn kho` from sanpham sp 
join ctphieunhap ctpn on sp.masp = ctpn.masps
join ctphieuxuat ctpx on sp.masp = ctpx.msp;

-- 13.	Truy vấn tên nhân viên, tên khách hàng và ngày bán của các phiếu xuất có ngày bán trong tháng 7 năm 2023.
select nv.hoten,kh.tenkh,px.ngayban from phieuxuat px 
join khachhang kh on px.makhs = kh.makh
join nhanvien nv on px.manvs = nv.manv
where month(px.ngayban) and year(px.ngayban);

-- 14.	Truy vấn tên nhân viên và tổng số lượng sản phẩm đã bán trong từng phiếu xuất.
select nv.hoten,px.sopx,sum(ctpx.sl) sales from phieuxuat px 
join ctphieuxuat ctpx on px.sopx = ctpx.spx
join nhanvien nv on px.manvs = nv.manv
group by px.sopx;

-- 15.	Truy vấn tên khách hàng và tổng số tiền đã chi tiêu trong từng phiếu xuất.
select kh.tenkh,sum(ctpx.sl * ctpx.giaban) from phieuxuat px 
join khachhang kh on px.makhs = kh.makh
join ctphieuxuat ctpx on px.sopx = ctpx.spx
group by px.sopx;

-- 16.	Truy vấn thông tin về nhà cung cấp và số lượng phiếu nhập mà họ đã tham gia.
select ncc.tenncc,count(pn.sopn) from phieunhap pn
join nhacungcap ncc on pn.manccs = ncc.mancc
group by ncc.mancc;

-- 17.	Truy vấn số lượng sản phẩm đã nhập và đã xuất theo từng loại sản phẩm.
select sp.tensp,sum(ctpn.soluong) `số lượng nhập`,sum(ctpx.sl) `số lượng xuất` from sanpham sp 
join ctphieunhap ctpn on sp.masp = ctpn.masps
join ctphieuxuat ctpx on sp.masp = ctpx.msp
group by sp.mlsp,sp.tensp;

-- 18.	Truy vấn tên loại sản phẩm và tổng giá trị của sản phẩm thuộc loại đó.
select lsp.tenlsp,sum(ctpn.gianhap * ctpn.soluong) from sanpham sp 
join loaisp lsp on sp.mlsp = lsp.malsp
join ctphieunhap ctpn on sp.masp = ctpn.masps
group by lsp.malsp;

-- 19.	Truy vấn tên loại sản phẩm và số lượng phiếu xuất mà có sản phẩm thuộc loại đó.
select lsp.tenlsp,count(ctpx.spx) from sanpham sp 
join loaisp lsp on sp.mlsp = lsp.malsp
join ctphieuxuat ctpx on sp.masp = ctpx.msp
group by lsp.malsp;

-- 20.	Truy vấn thông tin về những phiếu nhập mà số lượng sản phẩm nhập vào ít hơn hoặc bằng 3.
select * from ctphieunhap where soluong <= 3;

-- 21.	Truy vấn thông tin về những phiếu nhập mà giá trị nhập vào lớn hơn hoặc bằng 50 triệu đồng.
select * from ctphieunhap where gianhap <= 50000000;

-- 22.	Truy vấn thông tin về những phiếu nhập mà nhân viên nhập hàng có địa chỉ ở Hà Nội.
select pn.* from phieunhap pn
join nhanvien nv on pn.manvs = nv.manv
where nv.noisinh like "hanoi";

-- 23.	Truy vấn thông tin về những phiếu xuất mà nhân viên xuất hàng có số điện thoại bắt đầu bằng '09'.
select px.* from phieuxuat px 
join nhanvien nv on px.manvs = nv.manv
where nv.dienthoai like "09%";

-- 24.	Truy vấn tên nhân viên và số lượng phiếu xuất mà họ đã thực hiện.
select nv.hoten,count(px.sopx) from phieuxuat px 
join nhanvien nv on nv.manv = px.manvs
group by nv.manv;

-- 25.	Truy vấn thông tin về những phiếu xuất mà khách hàng có mã số 'KH001' đã thực hiện.
select * from phieuxuat where makhs like "KH01";

-- 26.	Truy vấn thông tin về những phiếu xuất mà khách hàng có mã số 'KH002' đã thực hiện, sắp xếp kết quả theo ngày bán giảm dần.
select * from phieuxuat where makhs like "KH02" order by day(ngayban) desc;

-- 27.	Truy vấn số lượng sản phẩm nhập vào và số lượng sản phẩm xuất ra theo từng loại sản phẩm, sắp xếp kết quả theo tên loại sản phẩm.
select lsp.tenlsp,sum(ctpn.gianhap * ctpn.soluong) from sanpham sp 
join loaisp lsp on sp.mlsp = lsp.malsp
join ctphieunhap ctpn on sp.masp = ctpn.masps
group by lsp.malsp 
order by lsp.tenlsp;

-- 28.	Truy vấn tên nhân viên và số lượng phiếu xuất mà họ đã thực hiện trong năm 2023.
select nv.hoten,count(px.sopx) 'số lượng' from phieuxuat px 
join nhanvien nv on px.manvs = nv.manv
where year(px.ngayban) = 2023
group by nv.manv;

-- 29.	Truy vấn tên nhân viên và số lượng phiếu nhập mà họ đã thực hiện trong tháng 5 năm 2023.
select nv.hoten,count(pn.sopn) from phieunhap pn 
join nhanvien nv on pn.manvs = nv.manv
where month(pn.ngaynhap) = 5 and year(pn.ngaynhap) = 2023
group by nv.manv;

-- 30.	Truy vấn tên nhân viên và số lượng phiếu xuất mà họ đã thực hiện trong năm 2023, sắp xếp kết quả theo số lượng giảm dần.
select nv.hoten,count(px.sopx) 'số lượng' from phieuxuat px 
join nhanvien nv on px.manvs = nv.manv
where year(px.ngayban) = 2023
group by nv.manv
order by count(px.sopx) desc;

-- 31.	Truy vấn tên nhân viên và số lượng phiếu nhập mà họ đã thực hiện trong năm 2023, sắp xếp kết quả theo số lượng tăng dần.
select nv.hoten,count(pn.sopn) 'số lượng' from phieunhap pn 
join nhanvien nv on pn.manvs = nv.manv
where year(pn.ngaynhap) = 2023
group by nv.manv
order by count(pn.sopn);

-- 32.	Truy vấn tên khách hàng và số lượng phiếu xuất mà họ đã thực hiện trong năm 2023, sắp xếp kết quả theo số lượng giảm dần.
select kh.tenkh,count(px.sopx) 'số lượng' from phieuxuat px
join khachhang kh on px.makhs = kh.makh
where year(px.ngayban) = 2023
group by kh.makh
order by count(px.sopx) desc;

-- 33.	Truy vấn tên nhiên viên và số lượng phiếu nhập mà họ đã thực hiện trong năm 2023, sắp xếp kết quả theo số lượng tăng dần.
select kh.tenkh,count(pn.sopn) 'số lượng' from phieunhap pn
join khachhang kh on pn.makh = kh.makh
where year(pn.ngaynhap) = 2023
group by kh.makh
order by count(pn.sopn);

-- 34.	Truy vấn thông tin về những sản phẩm có trong phiếu nhập và không có trong phiếu xuất.
select * from sanpham sp
join ctphieunhap ctpn on sp.masp = ctpn.masps
join ctphieuxuat ctpx on sp.masp = ctpx.msp
where ctpn.masps = sp.masp and not ctpx.msp = sp.masp;

-- 35.	Truy vấn thông tin về những sản phẩm có trong phiếu xuất và không có trong phiếu nhập.
select * from sanpham sp
join ctphieunhap ctpn on sp.masp = ctpn.masps
join ctphieuxuat ctpx on sp.masp = ctpx.msp
where not ctpn.masps = sp.masp and ctpx.msp = sp.masp;

-- 36.	Truy vấn số lượng sản phẩm nhập vào và số lượng sản phẩm xuất ra của từng loại sản phẩm, và chỉ lấy các loại sản phẩm có số lượng nhập vào lớn hơn số lượng xuất ra.
select lsp.tenlsp,sum(ctpn.soluong) slnhap,sum(ctpx.sl) slxuat from sanpham sp 
join ctphieunhap ctpn on sp.masp = ctpn.masps
join ctphieuxuat ctpx on sp.masp = ctpx.msp
join loaisp lsp on sp.mlsp = lsp.malsp
group by lsp.malsp
having slnhap > slxuat;

-- 37.	Truy vấn số lượng sản phẩm nhập vào và số lượng sản phẩm xuất ra của từng loại sản phẩm, và chỉ lấy các loại sản phẩm có số lượng nhập vào nhỏ hơn số lượng xuất ra.
select lsp.tenlsp,sum(ctpn.soluong) slnhap,sum(ctpx.sl) slxuat from sanpham sp 
join ctphieunhap ctpn on sp.masp = ctpn.masps
join ctphieuxuat ctpx on sp.masp = ctpx.msp
join loaisp lsp on sp.mlsp = lsp.malsp
group by lsp.malsp
having slnhap < slxuat;

-- 38.	Truy vấn tên loại sản phẩm và số lượng sản phẩm đã nhập vào, sắp xếp kết quả theo số lượng giảm dần.
select lsp.tenlsp,sum(ctpn.soluong) soluong from sanpham sp
join ctphieunhap ctpn on sp.masp = ctpn.masps
join loaisp lsp on lsp.malsp = sp.mlsp
group by lsp.malsp 
order by soluong desc;

-- 39.	Truy vấn tên loại sản phẩm và số lượng sản phẩm đã xuất ra, sắp xếp kết quả theo số lượng giảm dần.
select lsp.tenlsp,sum(ctpx.sl) soluong from sanpham sp
join ctphieuxuat ctpx on sp.masp = ctpx.msp
join loaisp lsp on lsp.malsp = sp.mlsp
group by lsp.malsp 
order by soluong desc;

-- 40.	Truy vấn tên loại sản phẩm và số lượng sản phẩm đã nhập vào, sắp xếp kết quả theo số lượng tăng dần.
select lsp.tenlsp,sum(ctpn.soluong) soluong from sanpham sp
join ctphieunhap ctpn on sp.masp = ctpn.masps
join loaisp lsp on lsp.malsp = sp.mlsp
group by lsp.malsp 
order by soluong;

-- 41.	Truy vấn tên loại sản phẩm và số lượng sản phẩm đã xuất ra, sắp xếp kết quả theo số lượng tăng dần.
select lsp.tenlsp,sum(ctpx.sl) soluong from sanpham sp
join ctphieuxuat ctpx on sp.masp = ctpx.msp
join loaisp lsp on lsp.malsp = sp.mlsp
group by lsp.malsp 
order by soluong;

-- 42.	Truy vấn tên nhân viên và số lượng sản phẩm nhập vào của từng nhân viên, và chỉ lấy những nhân viên có số lượng nhập vào lớn hơn 10 sản phẩm.
select nv.hoten,sum(ctpn.soluong) from  nhanvien nv 
join phieunhap pn on nv.manv = pn.manvs
join ctphieunhap ctpn on ctpn.sopns = pn.sopn
group by nv.manv
having sum(ctpn.soluong) > 10;

-- 43.	Truy vấn tên nhân viên và số lượng sản phẩm xuất ra của từng nhân viên, và chỉ lấy những nhân viên có số lượng xuất ra nhỏ hơn 5 sản phẩm.
select nv.hoten,sum(ctpx.sl) from nhanvien nv 
join phieuxuat px on nv.manv = px.manvs
join ctphieuxuat ctpx on px.sopx = ctpx.spx
group by nv.manv
having sum(ctpx.sl) < 5;

-- 44.	Truy vấn thông tin về những sản phẩm có giá nhập vào nhỏ hơn 5 triệu đồng và giá xuất ra lớn hơn 10 triệu đồng.
select sp.* from sanpham sp
join ctphieunhap ctpn on sp.masp = ctpn.masps
join ctphieuxuat ctpx on sp.masp = ctpx.msp
where ctpn.gianhap < 5000000 and ctpx.giaban > 10000000;

-- 45.	Truy vấn thông tin về những sản phẩm có giá nhập vào lớn hơn giá xuất ra.
select sp.* from sanpham sp
join ctphieunhap ctpn on sp.masp = ctpn.masps
join ctphieuxuat ctpx on sp.masp = ctpx.msp
where ctpn.gianhap > ctpx.giaban;

-- 46.	Truy vấn tên loại sản phẩm và số lượng phiếu nhập mà loại sản phẩm đó không có trong phiếu xuất.
select lsp.tenlsp,count(ctpn.sopns) from sanpham sp
join ctphieunhap ctpn on sp.masp = ctpn.masps
join ctphieuxuat ctpx on sp.masp = ctpx.msp
join loaisp lsp on lsp.malsp = sp.mlsp
where ctpn.masps = sp.masp and not ctpx.msp = sp.masp
group by lsp.malsp;

-- 47.	Truy vấn tên loại sản phẩm và số lượng phiếu xuất mà loại sản phẩm đó không có trong phiếu nhập.
select lsp.tenlsp,count(ctpn.sopns) from sanpham sp
join ctphieunhap ctpn on sp.masp = ctpn.masps
join ctphieuxuat ctpx on sp.masp = ctpx.msp
join loaisp lsp on lsp.malsp = sp.mlsp
where not ctpn.masps = sp.masp and ctpx.msp = sp.masp
group by lsp.malsp;

-- 48.	Truy vấn thông tin về những nhà cung cấp mà không có phiếu nhập hoặc phiếu nhập có giá trị nhập vào lớn hơn 20 triệu đồng.
select ncc.* from nhacungcap ncc 
join phieunhap pn on ncc.mancc = pn.manccs
join ctphieunhap ctpn on pn.sopn = ctpn.sopns
where not ncc.mancc = pn.manccs or ctpn.gianhap > 20000000;

-- 49.	Truy vấn thông tin về những khách hàng mà không có phiếu xuất hoặc phiếu xuất có giá trị xuất ra nhỏ hơn 50 triệu đồng.
select kh.* from khachhang kh 
join phieuxuat px on kh.makh = px.makhs
join ctphieuxuat ctpx on px.sopx = ctpx.spx
where not kh.makh = px.makhs or ctpx.giaban < 50000000;

-- 50.	Truy vấn thông tin về những nhân viên mà không có phiếu nhập hoặc phiếu xuất trong năm 2023.
select nv.* from nhanvien nv
join phieunhap pn on nv.manv = pn.manvs
join phieuxuat px on nv.manv = px.manvs
where not (nv.manv = pn.manvs or nv.manv = px.manvs) and year(now()) = 2023;