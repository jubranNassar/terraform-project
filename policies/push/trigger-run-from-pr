package spacelift

track {
    input.pull_request.action == "commented"
    input.pull_request.comment == concat(" ", ["/spacelift", "deploy", input.stack.id])
}

