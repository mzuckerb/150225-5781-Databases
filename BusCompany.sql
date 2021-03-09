CREATE TABLE Station
(
  station_number INT NOT NULL,
  addres INT NOT NULL,
  PRIMARY KEY (station_number)
);

CREATE TABLE BusCompany
(
  comp_id INT NOT NULL,
  comp_name INT NOT NULL,
  PRIMARY KEY (comp_id)
);

CREATE TABLE Bus
(
  bus_id INT NOT NULL,
  number_of_seats INT NOT NULL,
  comp_id INT NOT NULL,
  PRIMARY KEY (bus_id),
  FOREIGN KEY (comp_id) REFERENCES BusCompany(comp_id)
);

CREATE TABLE Driver
(
  driver_id INT NOT NULL,
  driver_name INT NOT NULL,
  PRIMARY KEY (driver_id)
);

CREATE TABLE WorkAt
(
  driver_id INT NOT NULL,
  comp_id INT NOT NULL,
  PRIMARY KEY (driver_id, comp_id),
  FOREIGN KEY (driver_id) REFERENCES Driver(driver_id),
  FOREIGN KEY (comp_id) REFERENCES BusCompany(comp_id)
);

CREATE TABLE Line
(
  line_number INT NOT NULL,
  first_station INT NOT NULL,
  last_station INT NOT NULL,
  comp_id INT NOT NULL,
  PRIMARY KEY (line_number, comp_id),
  FOREIGN KEY (comp_id) REFERENCES BusCompany(comp_id)
);

CREATE TABLE LineStation
(
  line_number INT NOT NULL,
  comp_id INT NOT NULL,
  station_number INT NOT NULL,
  PRIMARY KEY (line_number, comp_id, station_number),
  FOREIGN KEY (line_number, comp_id) REFERENCES Line(line_number, comp_id),
  FOREIGN KEY (station_number) REFERENCES Station(station_number)
);