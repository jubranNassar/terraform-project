package spacelift

webhook[wbdata] {
  endpoint := input.webhook_endpoints[_]
  endpoint.id == "discord-server"
  input.run_updated.run.drift_detection == true
  stack := input.run_updated.stack
  run := input.run_updated.run
  wbdata := {
    "endpoint_id": endpoint.id,
    "payload": {
      "embeds": [{
        "title": "Drift detection run triggered!",
        "description": sprintf("Stack: [%s](http://my-first-env.app.spacelift.tf/stack/%s)\nRun ID: [%s](http://my-first-env.app.spacelift.tf/stack/%s/run/%s)", [stack.name,stack.id,run.id,stack.id, run.id]),
        }]
     }
  }
  input.run_updated.run.type == "PROPOSED"
}

sample = true