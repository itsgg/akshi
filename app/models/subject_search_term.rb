class SubjectSearchTerm
  attr_reader :where_clause, :where_params, :order_params

  def initialize(keyword)
    @where_clause = ''
    @where_params = {}
    @order_params = ''
    build_search(keyword)
  end

  private

  def build_search(keyword)
    @order_params = 'updated_at desc'
    %i[title description].each do |field|
      @where_clause << "#{' OR ' unless @where_clause.eql? ''}lower(#{field}) like :#{field}"
      @where_params[field] = "#{keyword}%"
    end
  end
end