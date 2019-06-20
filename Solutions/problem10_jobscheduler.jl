#=

Implement a job scheduler which takes in a function f and an integer n, and calls f after n milliseconds.

=#

function job_scheduler(f::Function, n::Int)
    sleep(n/1000)
    f()
end

function job()
    return "Job Done!"
end
