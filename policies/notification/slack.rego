package spacelift

# slack[{"channel_id": "C0573PH8GSV"}] {
#   input.run_updated != null

#   run := input.run_updated.run
#   run.state == "FAILED"
# }

slack[{
  "channel_id": "C0573PH8GSV",
  "message": sprintf("http://my-first-env.app.spacelift.io/stack/%s/run/%s is trying to attach a policy!", [stack.id, run.id]),
}] {
  stack := input.run_updated.stack
  run := input.run_updated.run
  run.type == "TRACKED"
  run.state == "UNCONFIRMED"
  change := run.changes[_]
  change.phase == "plan"
  change.entity.type == "spacelift_policy_attachment"
}

sample { true }