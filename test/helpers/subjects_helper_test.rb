class SubjectsHelperTest < ActionView::TestCase
  test 'breadcrumb' do
    assert_dom_equal %{<nav class="breadcrumb"><ul><li><a href="/">Home</a></li><li><a href="/subjects/#{subjects(:programming).id}">#{subjects(:programming).title}</a></li><li><a href="/subjects/#{subjects(:programming_ruby).id}">#{subjects(:programming_ruby).title}</a></li><li class="is-active"><a href="/subjects/#{subjects(:programming_ruby_fibers)}">#{subjects(:programming_ruby_fibers).title}</a></li></ul></nav>}, breadcrumb(subjects(:programming_ruby_fibers))
  end
end