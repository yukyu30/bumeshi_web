module ApplicationHelper
    def default_meta_tags
        {
          site: 'BUMESHI!!',
          title: '美味しいお店を共有しよう',
          reverse: false,
          charset: 'utf-8',
          description: '美味しいお店を共有する飲食店レビューサイトです',
          keywords: 'BUMESHI!!, 飲食店レビュー',
          canonical: 'https://bumeshi-eat.herokuapp.com/',
          separator: '|',
          og: {
            site_name: :site,
            title: :title,
            image: image_url('/assets/ogp_sra.jpg'),
            description: :description,
            type: 'website',
            url: :canonical,
            locale: 'ja_JP',
          },
          twitter: {
            card: 'summary',
          }
        }
    end
end
