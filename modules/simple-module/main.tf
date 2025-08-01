provider "aws" {
    region = "us-east-2"
}

module "work_queue" {
    source = "./sqs-with-backoff"
    queue_name = "work-queue"
}

output "work_queue_name" {
    value = module.work_queue.queue_name
}

output "work_queue_dead_letter_name" {
    value = module.work_queue.dead_letter_queue_name
}