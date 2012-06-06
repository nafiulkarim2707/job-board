class CacheUtil
  class << self
    def expire_cache_for(inst)
      if inst.is_a?(Job)
        FileUtils.rm_rf(Rails.root.join('public', 'jobs', inst.title.parameterize, "#{inst.id}.html").to_s)
        FileUtils.rm_rf(Rails.root.join('public', 'jobs.html').to_s)
        FileUtils.rm_rf(Rails.root.join('public', 'index.html').to_s)
      elsif inst.is_a?(Company)
        FileUtils.rm_rf(Rails.root.join('public', 'companies', "#{inst.id}.html").to_s)
      end
    end

    def invalidate_caches
      FileUtils.rm_rf(Rails.root.join('public', 'companies').to_s)
      FileUtils.rm_rf(Rails.root.join('public', 'jobs').to_s)
      FileUtils.rm_rf(Rails.root.join('public', 'jobs.html').to_s)
      FileUtils.rm_rf(Rails.root.join('public', 'index.html').to_s)
    end

  end
end