module.exports = {
  purge: {
    enabled: true,
    content:[
      './app/views/**/*.html.erb',
      './app/views/layouts/header/*.html.erb',
      './app/views/layouts/header/parts/*.html.erb'
      
    ]
  },
  
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
