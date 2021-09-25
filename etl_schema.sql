DROP TABLE listing_info
DROP TABLE listing_review_stats
DROP TABLE host_review_stats
DROP TABLE host_location_review_stats
DROP TABLE reviewer_freq
DROP TABLE review_id

CREATE TABLE listing_info(
	listing_id INT,
	host_id INT,
	name VARCHAR(40),
	host_since DATE,
	host_location VARCHAR(40),
	minimum_nights INT,
	maximum_nights INT,
	instant_bookable BOOL,
	PRIMARY KEY (listing_id)
);

CREATE TABLE listing_review_stats(
	listing_id INT,
	listing_rating FLOAT,
	listing_score_accuracy FLOAT,
	listing_score_checkin FLOAT,
	listing_score_communication FLOAT,
	listing_score_location FLOAT,
	listing_score_value FLOAT,
	listing_total_reviews FLOAT,
	FOREIGN KEY (listing_id) REFERENCES listing_info(listing_id),
	PRIMARY KEY (listing_id)	
);

CREATE TABLE host_review_stats(
	host_id INT,
	host_rating FLOAT,
	host_score_accuracy FLOAT,
	host_score_checkin FLOAT,
	host_score_communication FLOAT,
	host_score_location FLOAT,
	host_score_value FLOAT,
	host_total_reviews FLOAT,
	PRIMARY KEY (host_id)	
);

CREATE TABLE host_location_review_stats(
	host_location_id INT,
	host_location_rating FLOAT,
	host_location_score_accuracy FLOAT,
	host_location_score_checkin FLOAT,
	host_location_score_communication FLOAT,
	host_location_score_location FLOAT,
	host_location_score_value FLOAT,
	host_location_total_reviews FLOAT,
	PRIMARY KEY (host_location_id)	
);

CREATE TABLE reviewer_freq(
	reviewer_id INT,
	listing_id INT,
	FOREIGN KEY (listing_id) REFERENCES listing_info(listing_id),
	PRIMARY KEY (reviewer_id)
);

CREATE TABLE review_id(
	review_id INT,
	listing_id INT,
	FOREIGN KEY (listing_id) REFERENCES listing_info(listing_id),
	PRIMARY KEY (review_id)
)