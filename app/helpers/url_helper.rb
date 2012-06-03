module UrlHelper

  def job_url(job)
    job_details_url(job.title.parameterize, job.id)
  end
end
