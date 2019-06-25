use simple_redis;

pub fn publish_event_command(msg: String) {
	// initiate connection
	match simple_redis::create("redis://127.0.0.1:6379/") {
		Ok(mut client) =>  {
				//	publish command
				println!("Connection to redis established.");
				client.publish("command", &msg);

				//	terminate connection
				match client.quit() {
						Err(error) => println!("Error: {}", error),
						_ => println!("Connection to redis terminated")
				}
		},
		Err(error) => println!("Unable to create Redis client: {}", error)
	}
}