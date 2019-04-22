module SubjectsHelper
  def breadcrumb(subject)
    links = []
    links.push href: '/', text: 'Home'
    parents(subject).reverse.each do |parent|
      links.push href: subject_path(parent), text: parent.title
    end
    links.push href: subject_path(subject), text: subject.title, klass: 'is-active'
    content_tag :nav, class: 'breadcrumb' do
      content_tag :ul do
        links.map do |link|
          concat breadcrumb_linK(link[:href], link[:text], link[:klass])
        end
      end
    end
  end

  private

  def breadcrumb_linK(href, text, klass = '')
    content_tag :li, class: klass do
      content_tag :a, href: href do
        text
      end
    end
  end

  def parents(subject, accumulator = [])
    parent = subject.parent
    return parents(parent, accumulator.push(parent)) if parent.present?

    accumulator
  end
end
