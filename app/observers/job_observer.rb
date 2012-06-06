class JobObserver < Mongoid::Observer
  def before_update(job)
    CacheUtil.expire_cache_for(Job.find(job.id))
  end
end
