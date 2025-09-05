CREATE TABLE IF NOT EXISTS dry_weights(
  id INT AUTO_INCREMENT,
  ounce VARCHAR(255),
  tbsp VARCHAR(255),
  cup VARCHAR(255),
  gram VARCHAR(255),
  PRIMARY KEY(id)
);

INSERT INTO dry_weights(ounce, tbsp, cup, gram) VALUES ("1/2", "1", "1/16", 15);
