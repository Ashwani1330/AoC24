use regex::Regex;
use std::fs::File;
use std::io::{BufRead, BufReader};

fn scan(expression: &str) -> i32 {
    let re = Regex::new(r"mul\((\d{1,3}),\s*(\d{1,3})\)").unwrap();
    let mut total_sum = 0;

    for captures in re.captures_iter(expression) {
        if let (Ok(x), Ok(y)) = (captures[1].parse::<i32>(), captures[2].parse::<i32>()) {
            total_sum += x*y;
        }
    }

    total_sum
}

fn main() {
    let file_path = r"src/day3.txt";

    let file = File::open(file_path).expect("Failed to open file");
    let reader = BufReader::new(file);

    let mut total_sum = 0;

    for line in reader.lines() {
        let line = line.expect("Failed to read line");
        total_sum += scan(&line);
    }

    println!("\n{}", total_sum);
}
