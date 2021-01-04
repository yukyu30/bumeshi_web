module.exports = {
  purge: {
    enabled: true,
    content:[
      './app/views/**/*.erb',
      './app/views/layouts/header/*.erb',
      './app/views/layouts/header/parts/*.erb'
      
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