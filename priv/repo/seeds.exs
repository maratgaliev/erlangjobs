alias Erlangjobs.Repo
alias Erlangjobs.Offers.Job

# find_or_create_job = fn title, iterator ->
#   case Repo.all(from u in Job, where: u.title == ^title) do
#     [] ->
#       %Job{}
#       |> Job.changeset(%{contact_name: "Test User", site: "www.testsite.ru", phone: "+1234567890", city: "Kazan", is_remote: true, company: "Test Company", salary: "100000", email: "job_bot@smartapps.ru", title: Enum.join([title, iterator], " "), description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu."})
#       |> Repo.insert!()
#     _ ->
#       IO.puts "Job: #{title} already exists, skipping"
#   end
# end

# Enum.each(1..50, fn x ->
#   find_or_create_job.("ErlangJob №", x)
# end
# )

jobs = Repo.all(Job)

for job <- jobs do
  updated_at = DateTime.utc_now() |> DateTime.to_naive()
  IO.puts(job.title)
  job
  |> Job.changeset(%{updated_at: updated_at, title: job.title})
  |> Repo.update
end
