DROP TABLE listings_info
DROP TABLE listing_review_stats
DROP TABLE host_review_stats
DROP TABLE host_location_review_stats
DROP TABLE reviewer_freq
DROP TABLE review_id

CREATE TABLE listings_info(
	listing_id INT,
	host_id INT,
	name VARCHAR(400),
	host_location VARCHAR(400),
	minimum_nights INT,
	maximum_nights INT,
	instant_bookable BOOL,
	PRIMARY KEY (listing_id)
);

CREATE TABLE listing_review_stats(
	listing_id INT,
	listing_rating FLOAT,
	listing_score_accuracy FLOAT,
	listing_score_cleanliness FLOAT,
	listing_score_checkin FLOAT,
	listing_score_communication FLOAT,
	listing_score_location FLOAT,
	listing_score_value FLOAT,
	listing_total_reviews FLOAT,
	FOREIGN KEY (listing_id) REFERENCES listings_info(listing_id),
	PRIMARY KEY (listing_id)	
);

CREATE TABLE host_review_stats(
	host_id INT NOT NULL,
	host_rating FLOAT,
	host_score_accuracy FLOAT,
	host_score_cleanliness FLOAT,
	host_score_checkin FLOAT,
	host_score_communication FLOAT,
	host_score_location FLOAT,
	host_score_value FLOAT,
	host_total_reviews FLOAT,
	PRIMARY KEY (host_id)	
);

CREATE TABLE host_location_review_stats(
	host_location VARCHAR(400),
	host_location_rating FLOAT,
	host_location_score_accuracy FLOAT,
	host_location_score_cleanliness FLOAT,
	host_location_score_checkin FLOAT,
	host_location_score_communication FLOAT,
	host_location_score_location FLOAT,
	host_location_score_value FLOAT,
	host_location_total_reviews FLOAT,
	PRIMARY KEY (host_location)	
);

CREATE TABLE reviewer_freq(
	reviewer_id INT,
	total_reviews INT,
	PRIMARY KEY (reviewer_id)
);

CREATE TABLE review_id(
	review_id INT,
	reviewer_id INT,
	listing_id INT,
	FOREIGN KEY (reviewer_id) REFERENCES reviewer_freq(reviewer_id),
	FOREIGN KEY (listing_id) REFERENCES listings_info(listing_id)
)

SELECT * FROM listings_info
SELECT * FROM listing_review_stats
SELECT * FROM host_review_stats
SELECT * FROM host_location_review_stats
SELECT * FROM reviewer_freq
SELECT * FROM review_id