class CompanyObserver < Mongoid::Observer
  def after_update(company)
    CacheUtil.expire_cache_for(Company.find(company.id))
  end
end
