resource "googlecalendar_event" "my_goto_talk" {
  summary     = "Use terraform to scale your team"
  description = "Terraform is a great tool for solving your infrastructure as code needs but isn’t it frustrating that not all software and services have terraform providers? In this section we take a 10 minute whirl-wind tour of the provider model and see how simple it is to write your own. "
  location    = "Location: 327"
  // Start and end times work best if specified as RFC3339.
  start = "2019-04-30T17:30:00-05:00"
  end   = "2019-04-30T18:20:00-05:00"

  // Each attendee is listed separately, and attendees can be marked as
  // optional.
  attendee {
    email = "ewilde@gmail.com"
  }

  attendee {
    email    = "you@goto.com"
    optional = true
  }
}


resource "googlecalendar_event" "give_talk_to_team" {
  summary     = "${googlecalendar_event.my_goto_talk.summary}"
  description = "${googlecalendar_event.my_goto_talk.description}"
  location    = "Zoom"
  // Start and end times work best if specified as RFC3339.
  start = "2019-05-05T11:30:00-00:00"
  end   = "2019-05-05T12:20:00-00:00"

  // Each attendee is listed separately, and attendees can be marked as
  // optional.
  attendee {
    email = "ewilde@gmail.com"
  }

  attendee {
    email    = "team@form3.tech"
    optional = true
  }
}