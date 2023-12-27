CREATE DATABASE smarttravel;

--@block
CREATE TABLE city(
    city_name VARCHAR(30),
    PRIMARY KEY(city_name)
);
--@block
INSERT INTO city (city_name) VALUES
('Casablanca'),
('Fez'),
('Tangier'),
('Marrakesh'),
('Salé'),
('Meknes'),
('Rabat'),
('Oujda'),
('Kenitra'),
('Agadir'),
('Tetouan'),
('Temara'),
('Safi'),
('Mohammedia'),
('Khouribga'),
('El Jadida'),
('Beni Mellal'),
('Aït Melloul'),
('Nador'),
('Dar Bouazza'),
('Settat'),
('Berrechid'),
('Khemisset'),
('Inezgane'),
('Ksar El Kebir'),
('Larache'),
('Guelmim'),
('Khenifra'),
('Berkane'),
('Taourirt'),
('Bouskoura'),
('Fquih Ben Salah'),
('Dcheira El Jihadia'),
('Oued Zem'),
('El Kelaa Des Sraghna'),
('Sidi Slimane'),
('Errachidia'),
('Guercif'),
('Oulad Teima'),
('Ben Guerir'),
('Tifelt'),
('Lqliaa'),
('Taroudant'),
('Sefrou'),
('Essaouira'),
('Fnideq'),
('Sidi Kacem'),
('Tiznit'),
('Tan-Tan'),
('Ouarzazate'),
('Souk El Arbaa'),
('Youssoufia'),
('Lahraouyine'),
('Martil'),
('Ain Harrouda'),
('Suq as-Sabt Awlad an-Nama'),
('Skhirat'),
('Ouazzane'),
('Benslimane'),
('Al Hoceima'),
('Beni Ansar'),
('Mdieq'),
('Sidi Bennour'),
('Midelt'),
('Azrou'),
('Drargua');
--@block
CREATE TABLE business(
    short_name VARCHAR(10),
    full_name VARCHAR(50),
    img VARCHAR(30),
    PRIMARY KEY(short_name)
);

--@block
INSERT INTO business (short_name, full_name, img) VALUES
('Supra', 'Supratours','Supratours.png'),
('CTM', 'Compagnie de Transports au Maroc', 'ctm.png'),
('SATAS', 'Société d''Aménagement et de Transports Autonomes', 'SATAS.jpg'),
('Afriquia', 'Afriquia Gaz', 'Afriquia_Gaz.png'),
('Ghazala', 'Trans Ghazala', 'ghazala.png');


--@block
CREATE TABLE bus(
    bus_number INT NOT NULL auto_increment,
    regist_number varchar(8),
    capacity INT(2),
    business_name varchar(10),
    PRIMARY KEY(bus_number, regist_number),
    FOREIGN KEY(business_name) REFERENCES business(short_name)
);

--@block
-- Inserting data for buses
INSERT INTO bus (regist_number, capacity, business_name) VALUES
('1234ABCD', 40, 'Supra'),
('5678EFGH', 40, 'Supra'),
('9101IJKL', 35, 'Supra'),
('1213MNOP', 35, 'Supra'),
('1415QRST', 50, 'Supra'),

('2345UVWX', 45, 'CTM'),
('6789YZAB', 50, 'CTM'),
('1011BCDE', 55, 'CTM'),
('1213FGHI', 45, 'CTM'),
('1415JKLM', 55, 'CTM'),

('1617OPQR', 30, 'SATAS'),
('1819STUV', 30, 'SATAS'),
('2021WXYZ', 35, 'SATAS'),
('2223ABDE', 35, 'SATAS'),
('2425FGHI', 40, 'SATAS'),

('2627JKLM', 40, 'Afriquia'),
('2829NOPQ', 45, 'Afriquia'),
('3031RSTU', 50, 'Afriquia'),
('3233VWXY', 40, 'Afriquia'),
('3435ZABC', 45, 'Afriquia'),

('3637DEFG', 35, 'Ghazala'),
('3839HIJK', 35, 'Ghazala'),
('4041LMNO', 40, 'Ghazala'),
('4243PQRS', 45, 'Ghazala'),
('4445TUVW', 50, 'Ghazala');


--@block
CREATE TABLE route(
    ID INT NOT NULL AUTO_INCREMENT,
    start_city VARCHAR(30),
    arrival_city VARCHAR(30),
    distance INT(5),
    duration time,
    UNIQUE (ID),
    PRIMARY KEY(start_city, arrival_city),
    FOREIGN KEY(start_city) REFERENCES city(city_name),
    FOREIGN KEY(arrival_city) REFERENCES city(city_name)
);

--@block
-- Inserting data for routes
INSERT INTO route (start_city, arrival_city, distance, duration) VALUES
('Casablanca', 'Fez', 320, '04:30:00'),
('Fez', 'Marrakesh', 530, '07:15:00'),
('Tangier', 'Agadir', 680, '09:00:00'),
('Marrakesh', 'Rabat', 330, '04:45:00'),
('Oujda', 'Kenitra', 610, '08:30:00'),

('Rabat', 'Tetouan', 290, '04:00:00'),
('Agadir', 'Oujda', 850, '11:30:00'),
('Kenitra', 'Casablanca', 200, '03:00:00'),
('Tetouan', 'Essaouira', 540, '07:45:00'),
('Temara', 'Safi', 150, '02:15:00'),

('Safi', 'Meknes', 380, '05:30:00'),
('Mohammedia', 'Khouribga', 220, '03:15:00'),
('Khouribga', 'El Jadida', 270, '03:45:00'),
('El Jadida', 'Beni Mellal', 320, '04:30:00'),
('Beni Mellal', 'Aït Melloul', 590, '08:15:00'),

('Nador', 'Dar Bouazza', 760, '10:45:00'),
('Dar Bouazza', 'Settat', 210, '03:00:00'),
('Settat', 'Berrechid', 60, '01:00:00'),
('Berrechid', 'Khemisset', 150, '02:15:00'),
('Inezgane', 'Ksar El Kebir', 400, '05:45:00'),
('Ksar El Kebir', 'Larache', 120, '02:00:00');


--@block
CREATE TABLE schedule(
    ID INT NOT NULL AUTO_INCREMENT,
    start_time TIMESTAMP,
    arrival_time TIMESTAMP NULL,
    the_date DATE,
    price INT(3),
    bus_num INT NOT NULL,
    c_start VARCHAR(30),
    c_arriv VARCHAR(30),
    PRIMARY KEY(ID),
    FOREIGN KEY(bus_num) REFERENCES bus(bus_number),
    FOREIGN KEY(c_start) REFERENCES route(start_city),
    FOREIGN KEY(c_arriv) REFERENCES route(arrival_city)
);

--@block
-- Inserting data for schedules with city associations
INSERT INTO schedule (start_time, arrival_time, the_date, price, bus_num, c_start, c_arriv) VALUES
('2023-01-01 08:00:00', '2023-01-01 12:00:00', '2023-01-01', 50, 1, 'Casablanca', 'Fez'),
('2023-01-02 10:00:00', '2023-01-02 14:30:00', '2023-01-02', 60, 2, 'Fez', 'Marrakesh'),
('2023-01-03 12:30:00', '2023-01-03 16:45:00', '2023-01-03', 70, 3, 'Tangier', 'Agadir'),
('2023-01-04 14:00:00', '2023-01-04 18:00:00', '2023-01-04', 55, 4, 'Marrakesh', 'Rabat'),
('2023-01-05 16:30:00', '2023-01-05 20:45:00', '2023-01-05', 65, 5, 'Oujda', 'Kenitra'),
('2023-01-06 18:00:00', '2023-01-06 22:30:00', '2023-01-06', 75, 1, 'Rabat', 'Tetouan'),
('2023-01-07 20:30:00', '2023-01-07 00:45:00', '2023-01-07', 80, 2, 'Agadir', 'Oujda'),
('2023-01-08 22:00:00', '2023-01-09 02:15:00', '2023-01-08', 90, 3, 'Kenitra', 'Casablanca'),
('2023-01-09 09:00:00', '2023-01-09 13:30:00', '2023-01-09', 55, 4, 'Tetouan', 'Essaouira'),
('2023-01-10 11:30:00', '2023-01-10 15:45:00', '2023-01-10', 65, 5, 'Temara', 'Safi');