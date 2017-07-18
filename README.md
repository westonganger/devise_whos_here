# Devise Who's Here
<a href='https://ko-fi.com/A5071NK' target='_blank'><img height='32' style='border:0px;height:32px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=a' border='0' alt='Buy Me a Coffee' /></a> 

Devise extension for logging current active users using only the fast Rails cache. This gem is for if you don't want long-term storage of this information and don't want to write to your database all the time.
# Install 

```ruby
# Gemfile

gem 'devise_whos_here'
```

# Usage

```ruby
# app/models/user.rb

devise :database_authenticatable, :confirmable, :whos_here
```

This will keep track of your logged in users with a variable in the Rails cache. Note all below times are returned as Time objects, not strings.

```ruby
User.last_active_since(30.minutes.ago) # returns an array of User objects

user = User.first

user.last_here_at # returns last known request time
```

Whenever you want to clear the cache simply run

```ruby
User.clear_whos_here!
```

# Credits
Created by Weston Ganger - @westonganger

<a href='https://ko-fi.com/A5071NK' target='_blank'><img height='32' style='border:0px;height:32px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=a' border='0' alt='Buy Me a Coffee' /></a> 
